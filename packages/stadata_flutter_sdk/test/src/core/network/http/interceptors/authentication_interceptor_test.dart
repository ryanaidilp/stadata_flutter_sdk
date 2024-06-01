import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import '../../../../../helpers/test_injection.dart';

class MockLocalStorage extends Mock implements LocalStorage {}

class MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

void main() {
  late LocalStorage mockLocalStorage;
  late RequestInterceptorHandler mockRequestInterceptorHandler;
  late AuthenticationInterceptor interceptor;
  late RequestOptions requestOptions;

  setUpAll(
    () {
      mockLocalStorage = MockLocalStorage();
      registerTestLazySingleton<LocalStorage>(
        mockLocalStorage,
        instanceName: 'secure',
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
      when(() => mockLocalStorage.get(StorageConstant.apiKey))
          .thenAnswer((_) => Future.value(apiKey));

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
