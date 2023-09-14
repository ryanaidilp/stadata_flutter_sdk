import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/constants/constants.dart';
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart';
import 'package:stadata_flutter_sdk/src/list/list.dart';
import 'package:stadata_flutter_sdk/src/view/view.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../helpers/test_injection.dart';

class MockStadataList extends Mock implements StadataList {}

class MockStadataView extends Mock implements StadataView {}

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  late StadataList mockStadataList;
  late StadataView mockStadataView;
  late LocalStorage mockLocalStorage;
  late StadataFlutter stadata;

  setUpAll(
    () async {
      mockStadataList = MockStadataList();
      registerTestLazySingleton<StadataList>(mockStadataList);
      mockStadataView = MockStadataView();
      registerTestLazySingleton<StadataView>(mockStadataView);
      mockLocalStorage = MockLocalStorage();
      registerTestFactory<LocalStorage>(
        mockLocalStorage,
        instanceName: 'secure',
      );

      stadata = StadataFlutter.instance;
    },
  );

  group(
    'StadataFlutter',
    () {
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

      test(
        'init stadata flutter without api key should '
        'throw exception and return false',
        () async {
          final result = await stadata.init(apiKey: '');
          expect(
            result,
            isFalse,
          );
        },
      );

      const apiKey = 'API_KEY';

      test(
        'if api key already stored, then return true and dont need to save',
        () async {
          when(
            () => mockLocalStorage.get(StorageConstant.apiKey),
          ).thenAnswer((_) async => apiKey);

          final result = await stadata.init(apiKey: apiKey);

          expect(result, isTrue);
          verify(
            () => mockLocalStorage.get(StorageConstant.apiKey),
          );
          verifyNever(
            () => mockLocalStorage.save(StorageConstant.apiKey, apiKey),
          );
        },
      );

      test(
        'if api key already stored and different from given api key, then '
        'save new key and return true if saved successfully',
        () async {
          when(
            () => mockLocalStorage.get(StorageConstant.apiKey),
          ).thenAnswer((_) async => apiKey);
          when(
            () => mockLocalStorage.save(StorageConstant.apiKey, apiKey),
          ).thenAnswer((_) async => false);

          final result = await stadata.init(apiKey: 'API_KEY_NEW');

          expect(result, isFalse);
          verify(
            () => mockLocalStorage.get(StorageConstant.apiKey),
          );
          verifyNever(
            () => mockLocalStorage.save(StorageConstant.apiKey, apiKey),
          );
        },
      );
    },
  );
}
