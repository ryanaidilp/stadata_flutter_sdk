import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart';
import 'package:stadata_flutter_sdk/src/core/storage/secure_storage_impl.dart';

import '../../../helpers/test_injection.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late FlutterSecureStorage mockStorage;
  late LocalStorage localStorage;

  setUpAll(() {
    mockStorage = MockFlutterSecureStorage();
    registerTestLazySingleton<FlutterSecureStorage>(mockStorage);
    localStorage = SecureStorageImpl();
  });

  const key = 'key';
  const value = 'value';

  group(
    'SecureStorageImpl',
    () {
      group(
        'get',
        () {
          test(
            'should return value when it found',
            () async {
              // arrange
              when(
                () => mockStorage.read(key: key),
              ).thenAnswer((_) async => value);

              // act
              final result = await localStorage.get(key);

              // assert
              expect(result, equals(value));
              verify(
                () => mockStorage.read(key: key),
              ).called(1);
            },
          );
        },
      );

      group(
        'has',
        () {
          test(
            'should return true when key exist',
            () async {
              // arrange
              when(
                () => mockStorage.containsKey(key: key),
              ).thenAnswer((_) async => true);

              // act
              final result = await localStorage.has(key);

              // assert
              expect(result, equals(true));
              verify(
                () => mockStorage.containsKey(key: key),
              ).called(1);
            },
          );

          test(
            'should return false when key does not exist',
            () async {
              // arrange
              when(
                () => mockStorage.containsKey(key: key),
              ).thenAnswer((_) async => true);

              // act
              final result = await localStorage.has(key);

              // assert
              expect(result, equals(true));
              verify(
                () => mockStorage.containsKey(key: key),
              ).called(1);
            },
          );
        },
      );

      group(
        'remove',
        () {
          test(
            'should return true when successfully removed',
            () async {
              // arrange
              when(
                () => mockStorage.delete(key: key),
              ).thenAnswer((_) async => true);

              // act
              final result = await localStorage.remove(key);

              // assert
              expect(result, equals(true));
              verify(
                () => mockStorage.delete(key: key),
              ).called(1);
            },
          );

          test(
            'should return false when failed to remove',
            () async {
              // arrange
              when(
                () => mockStorage.delete(key: key),
              ).thenThrow(Exception('Error'));

              // act
              final result = await localStorage.remove(key);

              // assert
              expect(result, equals(false));
              verify(
                () => mockStorage.delete(key: key),
              ).called(1);
            },
          );
        },
      );

      group(
        'save',
        () {
          test(
            'should return true when successfully saved',
            () async {
              // arrange
              when(
                () => mockStorage.write(key: key, value: value),
              ).thenAnswer((_) async => true);

              // act
              final result = await localStorage.save(key, value);

              // assert
              expect(result, equals(true));
              verify(
                () => mockStorage.write(key: key, value: value),
              ).called(1);
            },
          );

          test(
            'should return false when failed to save',
            () async {
              // arrange
              when(
                () => mockStorage.write(key: key, value: value),
              ).thenThrow(Exception('Error'));

              // act
              final result = await localStorage.save(key, value);

              // assert
              expect(result, equals(false));
              verify(
                () => mockStorage.write(key: key, value: value),
              ).called(1);
            },
          );
        },
      );
    },
  );
}
