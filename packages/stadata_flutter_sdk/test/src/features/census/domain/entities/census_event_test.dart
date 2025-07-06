import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tCensusEvent = CensusEvent(
    id: 'sp2020',
    name: 'Sensus Penduduk 2020',
    year: 2020,
  );

  group('CensusEvent', () {
    test('should be a subclass of BaseEntity', () {
      // assert
      expect(tCensusEvent, isA<BaseEntity>());
    });

    test('should return correct props', () {
      // act
      final props = tCensusEvent.props;

      // assert
      expect(
        props,
        [
          'sp2020',
          'Sensus Penduduk 2020',
          2020,
        ],
      );
    });

    test('should support equality comparison', () {
      // arrange
      const anotherCensusEvent = CensusEvent(
        id: 'sp2020',
        name: 'Sensus Penduduk 2020',
        year: 2020,
      );

      // assert
      expect(tCensusEvent, equals(anotherCensusEvent));
    });

    test('should not be equal when properties differ', () {
      // arrange
      const differentCensusEvent = CensusEvent(
        id: 'sp2010',
        name: 'Sensus Penduduk 2010',
        year: 2010,
      );

      // assert
      expect(tCensusEvent, isNot(equals(differentCensusEvent)));
    });

    test('should handle different id formats', () {
      // arrange
      const censusEventWithNumericId = CensusEvent(
        id: '123',
        name: 'Test Census',
        year: 2023,
      );

      // assert
      expect(censusEventWithNumericId.id, '123');
      expect(censusEventWithNumericId.name, 'Test Census');
      expect(censusEventWithNumericId.year, 2023);
    });

    test('should handle future years', () {
      // arrange
      const futureCensusEvent = CensusEvent(
        id: 'sp2030',
        name: 'Sensus Penduduk 2030',
        year: 2030,
      );

      // assert
      expect(futureCensusEvent.year, 2030);
      expect(futureCensusEvent.year, greaterThan(2020));
    });

    test('should handle historical years', () {
      // arrange
      const historicalCensusEvent = CensusEvent(
        id: 'sp1971',
        name: 'Sensus Penduduk 1971',
        year: 1971,
      );

      // assert
      expect(historicalCensusEvent.year, 1971);
      expect(historicalCensusEvent.year, lessThan(2000));
    });
  });
}
