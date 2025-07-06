import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tCensusCategoryModel = CensusCategoryModel(
    id: '1022',
    name: 'Klasifikasi Kelompok Umur',
    itemID: '1292',
    itemCode: '2',
    itemName: '5-9',
  );

  const tCensusCategory = CensusCategory(
    id: '1022',
    name: 'Klasifikasi Kelompok Umur',
    itemID: '1292',
    itemCode: '2',
    itemName: '5-9',
  );

  group('CensusCategoryModel', () {
    test('should be a subclass of CensusCategory', () {
      // assert
      expect(tCensusCategoryModel, isA<CensusCategory>());
    });

    test('should return a valid model when fromJsonWithIndex is called', () {
      // arrange
      final json = {
        'id_kategori_1': '1022',
        'nama_kategori_1': 'Klasifikasi Kelompok Umur',
        'id_item_kategori_1': '1292',
        'kode_item_kategori_1': '2',
        'nama_item__kategori_1': '5-9',
      };

      // act
      final result = CensusCategoryModel.fromJsonWithIndex(json, 1);

      // assert
      expect(result, tCensusCategoryModel);
    });

    test(
      'should return model with empty strings when fromJsonWithIndex has null values',
      () {
        // arrange
        final json = <String, dynamic>{
          'id_kategori_1': null,
          'nama_kategori_1': null,
        };

        // act
        final result = CensusCategoryModel.fromJsonWithIndex(json, 1);

        // assert
        expect(result.id, '');
        expect(result.name, '');
        expect(result.itemID, '');
        expect(result.itemCode, '');
        expect(result.itemName, '');
      },
    );

    test('should return a JSON map containing proper data', () {
      // act
      final result = tCensusCategoryModel.toJson();

      // assert
      final expectedJson = {
        'id': '1022',
        'name': 'Klasifikasi Kelompok Umur',
        'itemID': '1292',
        'itemCode': '2',
        'itemName': '5-9',
      };
      expect(result, expectedJson);
    });

    test('should create model from entity', () {
      // act
      final result = CensusCategoryModel.fromEntity(tCensusCategory);

      // assert
      expect(result, tCensusCategoryModel);
    });

    test('should return a new model when copyWith is called', () {
      // act
      final result = tCensusCategoryModel.copyWith(name: 'New Category Name');

      // assert
      expect(result.name, 'New Category Name');
      expect(result.id, tCensusCategoryModel.id);
      expect(result.itemID, tCensusCategoryModel.itemID);
      expect(result.itemCode, tCensusCategoryModel.itemCode);
      expect(result.itemName, tCensusCategoryModel.itemName);
    });

    test(
      'should return the same model when copyWith is called without params',
      () {
        // act
        final result = tCensusCategoryModel.copyWith();

        // assert
        expect(result, tCensusCategoryModel);
      },
    );
  });
}
