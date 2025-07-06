import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tCensusEventModel = CensusEventModel(
    id: 'sp2020',
    name: 'Sensus Penduduk 2020',
    year: 2020,
  );

  const tCensusEvent = CensusEvent(
    id: 'sp2020',
    name: 'Sensus Penduduk 2020',
    year: 2020,
  );

  group('CensusEventModel', () {
    test('should be a subclass of CensusEvent', () {
      // assert
      expect(tCensusEventModel, isA<CensusEvent>());
    });

    test('should return a valid model when fromJson is called', () {
      // arrange
      final json = {
        'id': 'sp2020',
        'kegiatan': 'Sensus Penduduk 2020',
        'tahun_kegiatan': 2020,
      };

      // act
      final result = CensusEventModel.fromJson(json);

      // assert
      expect(result, equals(tCensusEventModel));
    });

    test('should return a valid json when toJson is called', () {
      // arrange
      final expectedJson = {
        'id': 'sp2020',
        'kegiatan': 'Sensus Penduduk 2020',
        'tahun_kegiatan': 2020,
      };

      // act
      final result = tCensusEventModel.toJson();

      // assert
      expect(result, equals(expectedJson));
    });

    test('should return a valid model when fromEntity is called', () {
      // act
      final result = CensusEventModel.fromEntity(tCensusEvent);

      // assert
      expect(result, equals(tCensusEventModel));
    });

    test('should return a valid model when copyWith is called', () {
      // act
      final result = tCensusEventModel.copyWith(
        name: 'Sensus Penduduk 2030',
        year: 2030,
      );

      // assert
      expect(result.id, tCensusEventModel.id);
      expect(result.name, 'Sensus Penduduk 2030');
      expect(result.year, 2030);
    });

    test(
      'should return same values when copyWith is called without parameters',
      () {
        // act
        final result = tCensusEventModel.copyWith();

        // assert
        expect(result, equals(tCensusEventModel));
      },
    );
  });
}
