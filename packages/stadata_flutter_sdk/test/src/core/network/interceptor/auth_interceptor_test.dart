import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/config/api_config.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';

import '../../../../helpers/test_injection.dart';

class MockApiConfig extends Mock implements ApiConfig {}

void main() {
  late ApiConfig mockApiConfig;
  late AuthInterceptor interceptor;
  late RequestData requestData;

  setUpAll(() {
    mockApiConfig = MockApiConfig();
    registerTestLazySingleton<ApiConfig>(mockApiConfig);
    requestData = RequestData(
      method: 'GET',
      uri: Uri.parse('https://example.com/some/endpoint'),
      headers: {},
    );
    interceptor = AuthInterceptor();
  });

  tearDownAll(() => unregisterTestInjection);

  const apiKey = 'API_KEY';

  group('AuthInterceptor', () {
    test('modifies queryParameters with apiKey', () async {
      // Arrange
      when(() => mockApiConfig.apiKey).thenReturn(apiKey);

      // Act
      final result = await interceptor.onRequest(requestData);

      // Assert
      expect(result.uri.queryParameters, containsPair('key', apiKey));
      verify(() => mockApiConfig.apiKey).called(1);
    });
  });
}
