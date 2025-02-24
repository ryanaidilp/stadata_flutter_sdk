import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/config/config.dart';
import 'package:stadata_flutter_sdk/src/list/list.dart';
import 'package:stadata_flutter_sdk/src/view/view.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../helpers/test_injection.dart';

class MockStadataList extends Mock implements StadataList {}

class MockStadataView extends Mock implements StadataView {}

class MockApiConfig extends Mock implements ApiConfig {}

void main() {
  late StadataList mockStadataList;
  late StadataView mockStadataView;
  late ApiConfig mockApiConfig;
  late StadataFlutter stadata;

  setUpAll(() async {
    mockStadataList = MockStadataList();
    registerTestLazySingleton<StadataList>(mockStadataList);
    mockStadataView = MockStadataView();
    registerTestLazySingleton<StadataView>(mockStadataView);
    mockApiConfig = MockApiConfig();
    registerTestLazySingleton<ApiConfig>(mockApiConfig);

    stadata = StadataFlutter.instance;
  });

  tearDownAll(unregisterTestInjection);

  group('StadataFlutter', () {
    test(
      'instance is a StadataFlutter instance',
      () => expect(stadata, isA<StadataFlutter>()),
    );

    test(
      'stadata.list is a StadataList instance',
      () => expect(stadata.list, isA<StadataList>()),
    );

    test(
      'stadata.view is a StadataView instance',
      () => expect(stadata.view, isA<StadataView>()),
    );

    test('init stadata flutter without api key should '
        'throw exception and return false', () async {
      final result = await stadata.init(apiKey: '');
      expect(result, isFalse);
    });
  });
}
