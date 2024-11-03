import 'dart:async';

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/core/network/base_network_interceptor.dart';

class LoggingInterceptor extends BaseNetworkInterceptor {
  Log get log => injector.get<Log>();

  @override
  FutureOr<RequestData> onRequest(RequestData request) {
    log
      ..console('HTTP REQUEST')
      ..console('==============================')
      ..console(
        '${request.method.toUpperCase()} ${(request.uri.host) + request.uri.path}',
      )
      ..console('Headers:');
    request.headers.forEach(
      (k, v) => log.console('$k: $v'),
    );

    log.console('Query Parameters:');
    request.uri.queryParameters.forEach(
      (k, v) => log.console('$k: $v'),
    );

    if (request.body != null) {
      log.console('Body: ${request.body}');
    }

    return super.onRequest(request);
  }

  @override
  FutureOr<ResponseData> onResponse(ResponseData response) {
    log
      ..console('HTTP RESPONSE')
      ..console('==============================')
      ..console(
        '(${response.statusCode}) '
        '${response.request.uri.toString().split('?').first}',
      )
      ..console('Headers:');
    response.headers.forEach(
      (k, v) => log.console('$k: $v'),
    );

    if (response.request.uri.queryParameters.isNotEmpty) {
      log.console('Query:');
      response.request.uri.queryParameters.forEach(
        (k, v) {
          if (k != 'key') {
            log.console('$k: $v');
          }
        },
      );
    }

    log.console('Body: ${response.body}');

    return super.onResponse(response);
  }

  @override
  FutureOr<ResponseData> onError(Object error, StackTrace stackTrace) {
    log
      ..console(
        'HTTP ERROR',
        type: LogType.error,
      )
      ..console('==============================', type: LogType.error)
      ..console('$error', type: LogType.error);

    return super.onError(error, stackTrace);
  }
}
