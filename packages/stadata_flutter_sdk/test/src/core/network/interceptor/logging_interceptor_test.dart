import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';

import '../../../../helpers/test_injection.dart';

class MockLog extends Mock implements Log {}

void main() {
  group('LoggingInterceptor', () {
    late LoggingInterceptor interceptor;
    late MockLog mockLog;

    final requestData = RequestData(
      method: 'GET',
      uri: Uri.https(
        'example.com',
        '/some/endpoint',
      ).replace(
        queryParameters: {'Param1': 'Value1'},
      ),
      headers: {'Header1': 'Value1'},
      body: {'key': 'value'},
    );

    final response = ResponseData(
      statusCode: 200,
      request: requestData,
      headers: {
        'Header1': 'Value1',
      },
      body: {'key': 'value'},
    );

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

      // Act
      interceptor.onRequest(requestData);

      // Assert
      verify(() => mockLog.console('HTTP REQUEST'));
      verify(() => mockLog.console('=============================='));
      verify(() => mockLog.console('GET example.com/some/endpoint'));
      verify(() => mockLog.console('Headers:'));
      verify(() => mockLog.console('Header1: Value1'));
      verify(() => mockLog.console('Query Parameters:'));
      verify(() => mockLog.console('Param1: Value1'));
      verify(() => mockLog.console('Body: {key: value}'));
    });

    test('onResponse logs response information', () {
      // Arrange

      when(() => mockLog.console(any())).thenAnswer((_) async => {});

      when(
        () => response.headers.forEach(
          (k, v) => mockLog.console('$k: $v'),
        ),
      ).thenAnswer(
        (_) async => {},
      );

      when(
        () => response.request.uri.queryParameters.forEach(
          (k, v) => mockLog.console('$k: $v'),
        ),
      ).thenAnswer(
        (_) async => {},
      );

      // Act
      interceptor.onResponse(response);

      // Assert
      verify(() => mockLog.console('HTTP RESPONSE'));
      verify(() => mockLog.console('=============================='));
      verify(
        () => mockLog.console(
          '(200) https://example.com/some/endpoint',
        ),
      );
      verify(() => mockLog.console('Headers:'));
      verify(
        () => response.headers.forEach(
          (k, v) => mockLog.console('$k: $v'),
        ),
      );
      verify(() => mockLog.console('Query:'));
      verify(
        () => response.request.uri.queryParameters.forEach(
          (k, v) => mockLog.console('$k: $v'),
        ),
      );
      verify(() => mockLog.console('Body: {key: value}'));
    });

    test(
      'onError logs error information',
      () async {
        // Arrange

        final apiException = ApiException(
          'Error',
          500,
        );

        final stackTrace = StackTrace.fromString('Error trace');

        when(
          () => mockLog.console(any(), type: LogType.error),
        ).thenAnswer((_) async => {});

        // Act

        await expectLater(
          interceptor.onError(
            apiException,
            stackTrace,
          ),
          throwsA(apiException),
        );

        // Assert
        verify(
          () => mockLog.console(
            'HTTP ERROR',
            type: LogType.error,
          ),
        );
        verify(
          () => mockLog.console(
            '==============================',
            type: LogType.error,
          ),
        );
        verify(
          () => mockLog.console(
            'ApiException: Error (Status: 500)',
            type: LogType.error,
          ),
        );
      },
    );
  });
}
