import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tCategories = [
    CensusCategoryModel(
      id: '1022',
      name: 'Klasifikasi Kelompok Umur',
      itemID: '1292',
      itemCode: '2',
      itemName: '5-9',
    ),
    CensusCategoryModel(
      id: '1027',
      name: 'Klasifikasi Perkotaan dan Perdesaan',
      itemID: '1358',
      itemCode: '1',
      itemName: 'Perkotaan',
    ),
  ];

  const tCensusDataModel = CensusDataModel(
    regionID: '1667',
    regionCode: '0',
    regionName: 'INDONESIA',
    indicatorID: '7204701',
    indicatorName: 'Jumlah Penduduk Berumur 5 Tahun ke Atas',
    categories: tCategories,
    period: '2022',
    value: 6084498,
  );

  const tCensusData = CensusData(
    regionID: '1667',
    regionCode: '0',
    regionName: 'INDONESIA',
    indicatorID: '7204701',
    indicatorName: 'Jumlah Penduduk Berumur 5 Tahun ke Atas',
    categories: tCategories,
    period: '2022',
    value: 6084498,
  );

  group('CensusDataModel', () {
    test('should be a subclass of CensusData', () {
      // assert
      expect(tCensusDataModel, isA<CensusData>());
    });

    test('should return a valid model when fromJson is called', () {
      // arrange
      final json = {
        'id_wilayah': '1667',
        'kode_wilayah': '0',
        'nama_wilayah': 'INDONESIA',
        'level_wilayah': null,
        'id_indikator': '7204701',
        'nama_indikator': 'Jumlah Penduduk Berumur 5 Tahun ke Atas',
        'id_kategori_1': '1022',
        'nama_kategori_1': 'Klasifikasi Kelompok Umur',
        'id_item_kategori_1': '1292',
        'kode_item_kategori_1': '2',
        'nama_item__kategori_1': '5-9',
        'id_kategori_2': '1027',
        'nama_kategori_2': 'Klasifikasi Perkotaan dan Perdesaan',
        'id_item_kategori_2': '1358',
        'kode_item_kategori_2': '1',
        'nama_item__kategori_2': 'Perkotaan',
        'id_kategori_3': '',
        'nama_kategori_3': '',
        'id_item_kategori_3': '',
        'kode_item_kategori_3': '',
        'nama_item__kategori_3': '',
        'period': '2022',
        'nilai': 6084498,
      };

      // act
      final result = CensusDataModel.fromJson(json);

      // assert
      expect(result.regionID, '1667');
      expect(result.regionCode, '0');
      expect(result.regionName, 'INDONESIA');
      expect(result.regionLevel, isNull);
      expect(result.indicatorID, '7204701');
      expect(result.indicatorName, 'Jumlah Penduduk Berumur 5 Tahun ke Atas');
      expect(result.categories.length, 2); // Only non-empty categories
      expect(result.period, '2022');
      expect(result.value, 6084498);
    });

    test('should parse categories correctly and skip empty ones', () {
      // arrange
      final json = {
        'id_wilayah': '1667',
        'kode_wilayah': '0',
        'nama_wilayah': 'INDONESIA',
        'id_indikator': '7204701',
        'nama_indikator': 'Jumlah Penduduk Berumur 5 Tahun ke Atas',
        'id_kategori_1': '1022',
        'nama_kategori_1': 'Category 1',
        'id_item_kategori_1': '1292',
        'kode_item_kategori_1': '2',
        'nama_item__kategori_1': 'Item 1',
        'id_kategori_2': '', // Empty category
        'nama_kategori_2': '',
        'id_kategori_3': '1023',
        'nama_kategori_3': 'Category 3',
        'id_item_kategori_3': '1293',
        'kode_item_kategori_3': '3',
        'nama_item__kategori_3': 'Item 3',
        'period': '2022',
        'nilai': 1000,
      };

      // act
      final result = CensusDataModel.fromJson(json);

      // assert
      expect(result.categories.length, 2); // Should skip the empty category 2
      expect(result.categories[0].id, '1022');
      expect(result.categories[1].id, '1023');
    });

    test('should return a JSON map containing proper data', () {
      // act
      final result = tCensusDataModel.toJson();

      // assert
      expect(result['id_wilayah'], '1667');
      expect(result['kode_wilayah'], '0');
      expect(result['nama_wilayah'], 'INDONESIA');
      expect(result['id_indikator'], '7204701');
      expect(
        result['nama_indikator'],
        'Jumlah Penduduk Berumur 5 Tahun ke Atas',
      );
      expect(result['period'], '2022');
      expect(result['nilai'], 6084498);
    });

    test('should create model from entity', () {
      // act
      final result = CensusDataModel.fromEntity(tCensusData);

      // assert
      expect(result.regionID, tCensusData.regionID);
      expect(result.regionCode, tCensusData.regionCode);
      expect(result.regionName, tCensusData.regionName);
      expect(result.indicatorID, tCensusData.indicatorID);
      expect(result.indicatorName, tCensusData.indicatorName);
      expect(result.categories, tCensusData.categories);
      expect(result.period, tCensusData.period);
      expect(result.value, tCensusData.value);
    });

    test('should return a new model when copyWith is called', () {
      // act
      final result = tCensusDataModel.copyWith(
        regionName: 'NEW REGION',
        value: 9999999,
      );

      // assert
      expect(result.regionName, 'NEW REGION');
      expect(result.value, 9999999);
      expect(result.regionID, tCensusDataModel.regionID);
      expect(result.regionCode, tCensusDataModel.regionCode);
      expect(result.indicatorID, tCensusDataModel.indicatorID);
    });

    test(
      'should return the same model when copyWith is called without params',
      () {
        // act
        final result = tCensusDataModel.copyWith();

        // assert
        expect(result.regionID, tCensusDataModel.regionID);
        expect(result.regionCode, tCensusDataModel.regionCode);
        expect(result.regionName, tCensusDataModel.regionName);
        expect(result.categories, tCensusDataModel.categories);
        expect(result.value, tCensusDataModel.value);
      },
    );
  });
}
