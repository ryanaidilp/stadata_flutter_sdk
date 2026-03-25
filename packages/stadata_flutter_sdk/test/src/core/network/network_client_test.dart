import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/network/base_network_interceptor.dart';
import 'package:stadata_flutter_sdk/src/core/network/network_client.dart';
import 'package:stadata_flutter_sdk/src/core/network/request_data.dart';
import 'package:stadata_flutter_sdk/src/core/network/response_data.dart';
import 'package:stadata_flutter_sdk/src/core/network/stadata_http_interceptor.dart';

class _RecordingBaseInterceptor extends BaseNetworkInterceptor {
  bool onRequestCalled = false;
  bool onResponseCalled = false;
  bool onErrorCalled = false;
  RequestData? lastRequest;

  bool recoverOnError = false;

  @override
  FutureOr<RequestData> onRequest(RequestData request) {
    onRequestCalled = true;
    final updated = request.copyWith(
      headers: <String, String>{
        ...request.headers,
        'x-interceptor': 'applied',
      },
    );
    lastRequest = updated;
    return updated;
  }

  @override
  FutureOr<ResponseData> onResponse(ResponseData response) {
    onResponseCalled = true;
    return response;
  }

  @override
  FutureOr<ResponseData> onError(Object error, StackTrace stackTrace) {
    onErrorCalled = true;
    if (recoverOnError) {
      return ResponseData(
        statusCode: 200,
        headers: const <String, String>{},
        body: <String, dynamic>{'recovered': true},
        request:
            lastRequest ??
            RequestData(
              method: 'GET',
              uri: Uri.parse('https://example.com'),
              headers: const <String, String>{},
            ),
      );
    }
    return super.onError(error, stackTrace);
  }
}

class _ExternalProbeInterceptor implements StadataHttpInterceptor {
  _ExternalProbeInterceptor(this.name, this.events);

  final String name;
  final List<String> events;

  @override
  void onError(Object error, StackTrace stackTrace) {
    events.add('error-$name');
  }

  @override
  void onRequest(HttpClientRequest request, {dynamic body}) {
    events.add('request-$name');
  }

  @override
  void onResponse(
    HttpClientResponse response,
    HttpClientRequest request, {
    dynamic body,
  }) {
    events.add('response-$name');
  }
}

class AliceProbeInterceptor extends _ExternalProbeInterceptor {
  AliceProbeInterceptor(super.name, super.events);
}

Future<HttpServer> _startServer(
  Future<void> Function(HttpRequest request) handler,
) async {
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.listen((request) async {
    await handler(request);
  });
  return server;
}

void main() {
  group('CancelToken', () {
    test(
      'cancel should mark token as cancelled and complete whenCancel',
      () async {
        final token = CancelToken();

        expect(token.isCancelled, isFalse);

        token.cancel();
        await token.whenCancel;

        expect(token.isCancelled, isTrue);
      },
    );
  });

  group('NetworkClient', () {
    test(
      'get should apply interceptors, query params, and converter',
      () async {
        var receivedHeader = '';
        var receivedQuery = '';
        final server = await _startServer((request) async {
          receivedHeader = request.headers.value('x-interceptor') ?? '';
          receivedQuery = request.uri.queryParameters['a'] ?? '';
          request.response.statusCode = 200;
          request.response.headers.contentType = ContentType.json;
          request.response.write(jsonEncode(<String, dynamic>{'value': 10}));
          await request.response.close();
        });

        final baseInterceptor = _RecordingBaseInterceptor();
        final events = <String>[];
        final alice = AliceProbeInterceptor('alice', events);
        final other = _ExternalProbeInterceptor('other', events);

        final client = NetworkClient(
          baseUrl: 'http://127.0.0.1:${server.port}',
          interceptors: <BaseNetworkInterceptor>[baseInterceptor],
          externalInterceptors: <StadataHttpInterceptor>[alice, other],
        );

        final result = await client.get<Map<String, dynamic>>(
          '/ok',
          queryParams: <String, dynamic>{'a': 1},
          responseConverter:
              (json) => <String, dynamic>{'wrapped': json['value']},
        );

        expect(result, <String, dynamic>{'wrapped': 10});
        expect(baseInterceptor.onRequestCalled, isTrue);
        expect(baseInterceptor.onResponseCalled, isTrue);
        expect(receivedHeader, 'applied');
        expect(receivedQuery, '1');
        expect(
          events,
          <String>[
            'request-other',
            'request-alice',
            'response-other',
            'response-alice',
          ],
        );

        await server.close(force: true);
      },
    );

    test('post should send JSON body and parse success response', () async {
      late String receivedBody;
      final server = await _startServer((request) async {
        receivedBody = await utf8.decoder.bind(request).join();
        request.response.statusCode = 200;
        request.response.headers.contentType = ContentType.json;
        request.response.write(receivedBody);
        await request.response.close();
      });

      final client = NetworkClient(
        baseUrl: 'http://127.0.0.1:${server.port}',
      );

      final result = await client.post<Map<String, dynamic>>(
        '/post',
        body: <String, dynamic>{'name': 'stadata'},
      );

      expect(result, <String, dynamic>{'name': 'stadata'});
      expect(receivedBody, '{"name":"stadata"}');

      await server.close(force: true);
    });

    test('put and delete should route through generic sender', () async {
      final methods = <String>[];
      final server = await _startServer((request) async {
        methods.add(request.method);
        request.response.statusCode = 200;
        request.response.headers.contentType = ContentType.json;
        request.response.write(jsonEncode(<String, dynamic>{'ok': true}));
        await request.response.close();
      });

      final client = NetworkClient(
        baseUrl: 'http://127.0.0.1:${server.port}',
      );

      final putResult = await client.put<Map<String, dynamic>>(
        '/resource',
        body: <String, dynamic>{'active': true},
      );
      final deleteResult = await client.delete<Map<String, dynamic>>(
        '/resource',
      );

      expect(putResult, <String, dynamic>{'ok': true});
      expect(deleteResult, <String, dynamic>{'ok': true});
      expect(methods, <String>['PUT', 'DELETE']);

      await server.close(force: true);
    });

    test(
      'get should throw CancelledException when token is cancelled upfront',
      () async {
        final token = CancelToken()..cancel();
        final client = NetworkClient(baseUrl: 'http://127.0.0.1:9');

        expect(
          () => client.get<Map<String, dynamic>>('/cancel', cancelToken: token),
          throwsA(isA<CancelledException>()),
        );
      },
    );

    test(
      'get should throw api exception when error interceptor does not recover',
      () async {
        final server = await _startServer((request) async {
          request.response.statusCode = 500;
          request.response.headers.contentType = ContentType.json;
          request.response.write(
            jsonEncode(<String, dynamic>{'error': 'boom'}),
          );
          await request.response.close();
        });

        final baseInterceptor = _RecordingBaseInterceptor();
        final client = NetworkClient(
          baseUrl: 'http://127.0.0.1:${server.port}',
          interceptors: <BaseNetworkInterceptor>[baseInterceptor],
        );

        expect(
          () => client.get<Map<String, dynamic>>('/error'),
          throwsA(isA<ApiException>()),
        );

        await server.close(force: true);
      },
    );

    test('error interceptor should recover failed request', () async {
      final server = await _startServer((request) async {
        request.response.statusCode = 500;
        request.response.headers.contentType = ContentType.json;
        request.response.write(jsonEncode(<String, dynamic>{'error': 'boom'}));
        await request.response.close();
      });

      final baseInterceptor =
          _RecordingBaseInterceptor()..recoverOnError = true;
      final client = NetworkClient(
        baseUrl: 'http://127.0.0.1:${server.port}',
        interceptors: <BaseNetworkInterceptor>[baseInterceptor],
      );

      final result = await client.get<Map<String, dynamic>>('/recover');

      expect(result, <String, dynamic>{'recovered': true});
      expect(baseInterceptor.onErrorCalled, isTrue);

      await server.close(force: true);
    });
  });
}
