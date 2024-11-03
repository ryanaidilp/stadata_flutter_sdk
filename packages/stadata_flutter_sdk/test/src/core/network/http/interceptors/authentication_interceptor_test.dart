import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/config/api_config.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import '../../../../../helpers/test_injection.dart';

class MockApiConfig extends Mock implements ApiConfig {}

class MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

void main() {
  late ApiConfig mockApiConfig;
  late RequestInterceptorHandler mockRequestInterceptorHandler;
  late AuthenticationInterceptor interceptor;
  late RequestOptions requestOptions;

  setUpAll(
    () {
      mockApiConfig = MockApiConfig();
      registerTestLazySingleton<ApiConfig>(
        mockApiConfig,
      );
      mockRequestInterceptorHandler = MockRequestInterceptorHandler();
      interceptor = AuthenticationInterceptor();
      requestOptions = RequestOptions(path: '/some/endpoint');
    },
  );

  tearDownAll(() => unregisterTestInjection);

  const apiKey = 'API_KEY';

  group('AuthenticationInterceptor', () {
    test('modifies queryParameters with apiKey', () async {
      // Arrange
      when(() => mockApiConfig.apiKey).thenReturn(apiKey);

      // Act
      await interceptor.onRequest(
        requestOptions,
        mockRequestInterceptorHandler,
      );

      // Assert
      expect(
        requestOptions.queryParameters,
        containsPair(
          'key',
          apiKey,
        ),
      );
      verify(
        () => mockRequestInterceptorHandler.next(requestOptions),
      );
    });
  });
}
