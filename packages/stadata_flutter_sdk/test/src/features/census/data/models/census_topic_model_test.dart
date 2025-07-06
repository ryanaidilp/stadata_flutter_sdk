import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tCensusTopicModel = CensusTopicModel(
    id: 1,
    topic: 'Penduduk',
    eventID: 'sp2020',
    eventName: 'Sensus Penduduk 2020',
  );

  const tCensusTopic = CensusTopic(
    id: 1,
    topic: 'Penduduk',
    eventID: 'sp2020',
    eventName: 'Sensus Penduduk 2020',
  );

  group('CensusTopicModel', () {
    test('should be a subclass of CensusTopic', () {
      // assert
      expect(tCensusTopicModel, isA<CensusTopic>());
    });

    test('should return a valid model when fromJson is called', () {
      // arrange
      final json = {
        'id': 1,
        'topik': 'Penduduk',
        'id_kegiatan': 'sp2020',
        'kegiatan': 'Sensus Penduduk 2020',
      };

      // act
      final result = CensusTopicModel.fromJson(json);

      // assert
      expect(result, equals(tCensusTopicModel));
    });

    test('should return a valid json when toJson is called', () {
      // arrange
      final expectedJson = {
        'id': 1,
        'topik': 'Penduduk',
        'id_kegiatan': 'sp2020',
        'kegiatan': 'Sensus Penduduk 2020',
      };

      // act
      final result = tCensusTopicModel.toJson();

      // assert
      expect(result, equals(expectedJson));
    });

    test('should return a valid model when fromEntity is called', () {
      // act
      final result = CensusTopicModel.fromEntity(tCensusTopic);

      // assert
      expect(result, equals(tCensusTopicModel));
    });

    test('should return a valid model when copyWith is called', () {
      // act
      final result = tCensusTopicModel.copyWith(
        topic: 'Ekonomi',
        eventName: 'Sensus Ekonomi 2020',
      );

      // assert
      expect(result.id, tCensusTopicModel.id);
      expect(result.topic, 'Ekonomi');
      expect(result.eventID, tCensusTopicModel.eventID);
      expect(result.eventName, 'Sensus Ekonomi 2020');
    });

    test('should return same values when copyWith is called without parameters', () {
      // act
      final result = tCensusTopicModel.copyWith();

      // assert
      expect(result, equals(tCensusTopicModel));
    });
  });
}