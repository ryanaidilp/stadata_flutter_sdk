import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tCensusAreaModel = CensusAreaModel(
    id: 1101,
    mfdCode: '11.01',
    name: 'Kabupaten Simeulue',
    slug: 'kabupaten-simeulue',
  );

  const tCensusArea = CensusArea(
    id: 1101,
    mfdCode: '11.01',
    name: 'Kabupaten Simeulue',
    slug: 'kabupaten-simeulue',
  );

  group('CensusAreaModel', () {
    test('should be a subclass of CensusArea', () {
      // assert
      expect(tCensusAreaModel, isA<CensusArea>());
    });

    test('should return a valid model when fromJson is called', () {
      // arrange
      final json = {
        'id': 1101,
        'kode_mfd': '11.01',
        'nama': 'Kabupaten Simeulue',
        'slug': 'kabupaten-simeulue',
      };

      // act
      final result = CensusAreaModel.fromJson(json);

      // assert
      expect(result, equals(tCensusAreaModel));
    });

    test('should return a valid json when toJson is called', () {
      // arrange
      final expectedJson = {
        'id': 1101,
        'nama': 'Kabupaten Simeulue',
        'slug': 'kabupaten-simeulue',
        'kode_mfd': '11.01',
      };

      // act
      final result = tCensusAreaModel.toJson();

      // assert
      expect(result, equals(expectedJson));
    });

    test('should return a valid model when fromEntity is called', () {
      // act
      final result = CensusAreaModel.fromEntity(tCensusArea);

      // assert
      expect(result, equals(tCensusAreaModel));
    });

    test('should return a valid entity when toEntity is called', () {
      // act
      final result = tCensusAreaModel.toEntity();

      // assert
      expect(result, equals(tCensusArea));
    });
  });
}
