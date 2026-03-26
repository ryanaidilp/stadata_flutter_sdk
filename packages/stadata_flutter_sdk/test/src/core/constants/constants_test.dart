import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/constants/constants.dart';

void main() {
  group('StorageConstant', () {
    test('apiKey should match expected key', () {
      expect(StorageConstant.apiKey, 'api_key');
    });
  });

  group('QueryParamConstant', () {
    test('should expose expected query param keys', () {
      expect(QueryParamConstant.id, 'id');
      expect(QueryParamConstant.domain, 'domain');
      expect(QueryParamConstant.page, 'page');
      expect(QueryParamConstant.lang, 'lang');
      expect(QueryParamConstant.variable, 'var');
      expect(QueryParamConstant.dataset, 'dataset');
    });
  });

  group('InjectorConstant', () {
    test('should expose expected named client keys', () {
      expect(InjectorConstant.listClient, 'listClient');
      expect(InjectorConstant.viewClient, 'viewClient');
      expect(
        InjectorConstant.interoparibilityClient,
        'interoperabilityClient',
      );
    });
  });
}
