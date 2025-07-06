import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tCensusCategory = CensusCategory(
    id: '1022',
    name: 'Klasifikasi Kelompok Umur',
    itemID: '1292',
    itemCode: '2',
    itemName: '5-9',
  );

  group('CensusCategory', () {
    test('should be a subclass of BaseEntity', () {
      // assert
      expect(tCensusCategory, isA<BaseEntity>());
    });

    test('should return correct props', () {
      // act
      final props = tCensusCategory.props;

      // assert
      expect(
        props,
        [
          '1022',
          'Klasifikasi Kelompok Umur',
          '1292',
          '2',
          '5-9',
        ],
      );
    });

    test('should support equality comparison', () {
      // arrange
      const anotherCensusCategory = CensusCategory(
        id: '1022',
        name: 'Klasifikasi Kelompok Umur',
        itemID: '1292',
        itemCode: '2',
        itemName: '5-9',
      );

      // assert
      expect(tCensusCategory, equals(anotherCensusCategory));
    });

    test('should not be equal when properties differ', () {
      // arrange
      const differentCensusCategory = CensusCategory(
        id: '1023',
        name: 'Different Category',
        itemID: '1293',
        itemCode: '3',
        itemName: '10-14',
      );

      // assert
      expect(tCensusCategory, isNot(equals(differentCensusCategory)));
    });
  });
}
