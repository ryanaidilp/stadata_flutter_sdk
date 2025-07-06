import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tCensusArea = CensusArea(
    id: 1,
    name: 'DKI Jakarta',
    slug: 'dki-jakarta',
    mfdCode: '31',
  );

  group('CensusArea', () {
    test('should be a subclass of BaseEntity', () {
      // assert
      expect(tCensusArea, isA<BaseEntity>());
    });

    test('should return correct props', () {
      // act
      final props = tCensusArea.props;

      // assert
      expect(
        props,
        [
          1,
          'DKI Jakarta',
          'dki-jakarta',
          '31',
        ],
      );
    });

    test('should support equality comparison', () {
      // arrange
      const anotherCensusArea = CensusArea(
        id: 1,
        name: 'DKI Jakarta',
        slug: 'dki-jakarta',
        mfdCode: '31',
      );

      // assert
      expect(tCensusArea, equals(anotherCensusArea));
    });

    test('should not be equal when properties differ', () {
      // arrange
      const differentCensusArea = CensusArea(
        id: 2,
        name: 'Jawa Barat',
        slug: 'jawa-barat',
        mfdCode: '32',
      );

      // assert
      expect(tCensusArea, isNot(equals(differentCensusArea)));
    });

    test('should handle different area types', () {
      // arrange
      const regencyArea = CensusArea(
        id: 101,
        name: 'Kabupaten Bogor',
        slug: 'kabupaten-bogor',
        mfdCode: '3201',
      );

      // assert
      expect(regencyArea.name, 'Kabupaten Bogor');
      expect(regencyArea.mfdCode, '3201');
      expect(regencyArea.mfdCode.length, 4);
    });

    test('should handle city areas', () {
      // arrange
      const cityArea = CensusArea(
        id: 201,
        name: 'Kota Bogor',
        slug: 'kota-bogor',
        mfdCode: '3271',
      );

      // assert
      expect(cityArea.name, contains('Kota'));
      expect(cityArea.slug, 'kota-bogor');
    });

    test('should handle special regions', () {
      // arrange
      const specialRegion = CensusArea(
        id: 301,
        name: 'DI Yogyakarta',
        slug: 'di-yogyakarta',
        mfdCode: '34',
      );

      // assert
      expect(specialRegion.name, contains('DI'));
      expect(specialRegion.mfdCode, '34');
    });

    test('should handle areas with long names', () {
      // arrange
      const longNameArea = CensusArea(
        id: 401,
        name: 'Kabupaten Kepulauan Seribu',
        slug: 'kabupaten-kepulauan-seribu',
        mfdCode: '3101',
      );

      // assert
      expect(longNameArea.name.length, greaterThan(10));
      expect(longNameArea.slug.contains('-'), true);
    });

    test('should handle numeric-only MFD codes', () {
      // arrange
      const numericMfdArea = CensusArea(
        id: 501,
        name: 'Test Area',
        slug: 'test-area',
        mfdCode: '1234567890',
      );

      // assert
      expect(numericMfdArea.mfdCode, '1234567890');
      expect(int.tryParse(numericMfdArea.mfdCode), isNotNull);
    });

    test('should handle large ID numbers', () {
      // arrange
      const largeIdArea = CensusArea(
        id: 999999,
        name: 'Large ID Area',
        slug: 'large-id-area',
        mfdCode: '99',
      );

      // assert
      expect(largeIdArea.id, 999999);
      expect(largeIdArea.id, greaterThan(1000));
    });
  });
}
