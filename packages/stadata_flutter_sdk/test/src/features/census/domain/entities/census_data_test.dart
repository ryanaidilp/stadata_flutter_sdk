import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tCategories = [
    CensusCategory(
      id: '1022',
      name: 'Klasifikasi Kelompok Umur',
      itemID: '1292',
      itemCode: '2',
      itemName: '5-9',
    ),
    CensusCategory(
      id: '1027',
      name: 'Klasifikasi Perkotaan dan Perdesaan',
      itemID: '1358',
      itemCode: '1',
      itemName: 'Perkotaan',
    ),
  ];

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

  group('CensusData', () {
    test('should be a subclass of BaseEntity', () {
      // assert
      expect(tCensusData, isA<BaseEntity>());
    });

    test('should return correct props', () {
      // act
      final props = tCensusData.props;

      // assert
      expect(
        props,
        [
          '1667',
          '0',
          'INDONESIA',
          null,
          '7204701',
          'Jumlah Penduduk Berumur 5 Tahun ke Atas',
          tCategories,
          '2022',
          6084498,
        ],
      );
    });

    test('should support equality comparison', () {
      // arrange
      const anotherCensusData = CensusData(
        regionID: '1667',
        regionCode: '0',
        regionName: 'INDONESIA',
        indicatorID: '7204701',
        indicatorName: 'Jumlah Penduduk Berumur 5 Tahun ke Atas',
        categories: tCategories,
        period: '2022',
        value: 6084498,
      );

      // assert
      expect(tCensusData, equals(anotherCensusData));
    });

    test('should not be equal when properties differ', () {
      // arrange
      const differentCensusData = CensusData(
        regionID: '1668',
        regionCode: '1',
        regionName: 'ACEH',
        indicatorID: '7204702',
        indicatorName: 'Different Indicator',
        categories: [],
        period: '2023',
        value: 5000000,
      );

      // assert
      expect(tCensusData, isNot(equals(differentCensusData)));
    });

    test('should handle nullable regionLevel', () {
      // arrange
      const censusDataWithRegionLevel = CensusData(
        regionID: '1667',
        regionCode: '0',
        regionName: 'INDONESIA',
        indicatorID: '7204701',
        indicatorName: 'Jumlah Penduduk Berumur 5 Tahun ke Atas',
        categories: tCategories,
        period: '2022',
        value: 6084498,
        regionLevel: 'Country',
      );

      // assert
      expect(censusDataWithRegionLevel.regionLevel, 'Country');
      expect(tCensusData.regionLevel, isNull);
    });

    test('should handle empty categories list', () {
      // arrange
      const censusDataWithEmptyCategories = CensusData(
        regionID: '1667',
        regionCode: '0',
        regionName: 'INDONESIA',
        indicatorID: '7204701',
        indicatorName: 'Jumlah Penduduk Berumur 5 Tahun ke Atas',
        categories: [],
        period: '2022',
        value: 6084498,
      );

      // assert
      expect(censusDataWithEmptyCategories.categories, isEmpty);
    });
  });
}
