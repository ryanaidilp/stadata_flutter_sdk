import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';

import '../../../../../helpers/test_injection.dart';

class MockLog extends Mock implements Log {}

void main() {
  group('LoggingInterceptor', () {
    late LoggingInterceptor interceptor;
    late MockLog mockLog;

    setUpAll(
      () {
        mockLog = MockLog();
        registerTestLazySingleton<Log>(mockLog);
        interceptor = LoggingInterceptor();
      },
    );

    tearDownAll(() => unregisterTestInjection);

    test('onRequest logs request information', () {
      // Arrange
      when(() => mockLog.console(any())).thenAnswer(
        (_) async => {},
      );

      final options = RequestOptions(
        path: '/some/endpoint',
        method: 'GET',
        baseUrl: 'https://example.com',
        headers: {'Header1': 'Value1'},
        queryParameters: {'Param1': 'Value1'},
        data: {'key': 'value'},
      );

      // Act
      interceptor.onRequest(options, RequestInterceptorHandler());

      // Assert
      verify(() => mockLog.console('HTTP REQUEST'));
      verify(() => mockLog.console('=============================='));
      verify(() => mockLog.console('GET https://example.com/some/endpoint'));
      verify(() => mockLog.console('Headers:'));
      verify(() => mockLog.console('Header1: Value1'));
      verify(() => mockLog.console('Query Parameters:'));
      verify(() => mockLog.console('Param1: Value1'));
      verify(() => mockLog.console('Body: {key: value}'));
    });

    test('onResponse logs response information', () {
      // Arrange
      final response = Response<dynamic>(
        requestOptions: RequestOptions(
          path: '/some/endpoint',
          baseUrl: 'https://example.com',
        ),
        statusCode: 200,
        statusMessage: 'OK',
        headers: Headers.fromMap(
          {
            'Header1': ['Value1'],
          },
        ),
        data: {'key': 'value'},
      );
      when(() => mockLog.console(any())).thenAnswer((_) async => {});

      when(
        () => response.headers.forEach(
          (k, v) => mockLog.console('$k: $v'),
        ),
      ).thenAnswer(
        (_) async => {},
      );

      // Act
      interceptor.onResponse(response, ResponseInterceptorHandler());

      // Assert
      verify(() => mockLog.console('HTTP RESPONSE'));
      verify(() => mockLog.console('=============================='));
      verify(
        () => mockLog.console(
          '200 (OK) '
          'https://example.com/some/endpoint',
        ),
      );
      verify(() => mockLog.console('Headers:'));
      verify(
        () => response.headers.forEach(
          (k, v) => mockLog.console('$k: $v'),
        ),
      );
      verify(() => mockLog.console('Body: {key: value}'));
    });

    test(
      'onError logs error information',
      () {
        // Arrange
        final dioException = DioException(
          stackTrace: StackTrace.fromString('Example stack trace'),
          requestOptions: RequestOptions(
            path: '/some/endpoint',
            baseUrl: 'https://example.com',
          ),
          response: Response(
            statusCode: 404,
            requestOptions: RequestOptions(
              connectTimeout: const Duration(milliseconds: 30000),
              path: '/some/endpoint',
              baseUrl: 'https://example.com',
            ),
            statusMessage: 'Not Found',
            data: {'error': 'Not Found'},
          ),
        );

        when(
          () => mockLog.console(any(), type: LogType.error),
        ).thenAnswer((_) async => {});

        // Act
        interceptor.onError(
          dioException,
          ErrorInterceptorHandler(),
        );

        // Assert
        verify(() => mockLog.console('HTTP ERROR', type: LogType.error));
        verify(
          () => mockLog.console(
            '==============================',
            type: LogType.error,
          ),
        );
        verify(
          () => mockLog.console(
            '404 (Not Found) '
            'https://example.com/some/endpoint',
            type: LogType.error,
          ),
        );
        verify(
          () =>
              mockLog.console('Body: {error: Not Found}', type: LogType.error),
        );
      },
    );

    test(
      'onError logs error information if response is null',
      () {
        // Arrange
        final dioException = DioException(
          stackTrace: StackTrace.fromString('Example stack trace'),
          message: 'There is something wrong',
          error: 'Error',
          requestOptions: RequestOptions(
            path: '/some/endpoint',
            baseUrl: 'https://example.com',
          ),
        );

        when(
          () => mockLog.console(any(), type: LogType.error),
        ).thenAnswer((_) async => {});

        // Act
        interceptor.onError(
          dioException,
          ErrorInterceptorHandler(),
        );

        // Assert
        verify(() => mockLog.console('HTTP ERROR', type: LogType.error));
        verify(
          () => mockLog.console(
            '==============================',
            type: LogType.error,
          ),
        );
        verify(
          () => mockLog.console(
            'Error (${DioExceptionType.unknown}) '
            'https://example.com/some/endpoint',
            type: LogType.error,
          ),
        );
      },
    );
  });
}
