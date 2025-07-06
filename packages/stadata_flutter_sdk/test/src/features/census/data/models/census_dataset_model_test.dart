import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tCensusDatasetModel = CensusDatasetModel(
    id: 101,
    topicID: 1,
    topic: 'Penduduk',
    eventID: 1,
    name: 'Jumlah Penduduk',
    description: 'Data jumlah penduduk berdasarkan hasil sensus',
  );

  const tCensusDataset = CensusDataset(
    id: 101,
    topicID: 1,
    topic: 'Penduduk',
    eventID: 1,
    name: 'Jumlah Penduduk',
    description: 'Data jumlah penduduk berdasarkan hasil sensus',
  );

  group('CensusDatasetModel', () {
    test('should be a subclass of CensusDataset', () {
      // assert
      expect(tCensusDatasetModel, isA<CensusDataset>());
    });

    test('should return a valid model when fromJson is called', () {
      // arrange
      final json = {
        'id': 101,
        'id_topik': 1,
        'topik': 'Penduduk',
        'id_kegiatan': 1,
        'nama': 'Jumlah Penduduk',
        'deskripsi': 'Data jumlah penduduk berdasarkan hasil sensus',
      };

      // act
      final result = CensusDatasetModel.fromJson(json);

      // assert
      expect(result, equals(tCensusDatasetModel));
    });

    test('should return a valid json when toJson is called', () {
      // arrange
      final expectedJson = {
        'id': 101,
        'id_topik': 1,
        'topik': 'Penduduk',
        'id_kegiatan': 1,
        'nama': 'Jumlah Penduduk',
        'deskripsi': 'Data jumlah penduduk berdasarkan hasil sensus',
      };

      // act
      final result = tCensusDatasetModel.toJson();

      // assert
      expect(result, equals(expectedJson));
    });

    test('should return a valid model when fromEntity is called', () {
      // act
      final result = CensusDatasetModel.fromEntity(tCensusDataset);

      // assert
      expect(result, equals(tCensusDatasetModel));
    });

    test('should return a valid model when copyWith is called', () {
      // act
      final result = tCensusDatasetModel.copyWith(
        name: 'Jumlah Rumah Tangga',
        description: 'Data jumlah rumah tangga berdasarkan hasil sensus',
      );

      // assert
      expect(result.id, tCensusDatasetModel.id);
      expect(result.topicID, tCensusDatasetModel.topicID);
      expect(result.topic, tCensusDatasetModel.topic);
      expect(result.eventID, tCensusDatasetModel.eventID);
      expect(result.name, 'Jumlah Rumah Tangga');
      expect(result.description, 'Data jumlah rumah tangga berdasarkan hasil sensus');
    });

    test('should return same values when copyWith is called without parameters', () {
      // act
      final result = tCensusDatasetModel.copyWith();

      // assert
      expect(result.id, tCensusDatasetModel.id);
      expect(result.topicID, tCensusDatasetModel.topicID);
      expect(result.topic, tCensusDatasetModel.topic);
      expect(result.eventID, tCensusDatasetModel.eventID);
      expect(result.name, tCensusDatasetModel.name);
      expect(result.description, tCensusDatasetModel.description);
    });

    test('should handle null description in fromJson', () {
      // arrange
      final json = {
        'id': 101,
        'id_topik': 1,
        'topik': 'Penduduk',
        'id_kegiatan': 1,
        'nama': 'Jumlah Penduduk',
        'deskripsi': null,
      };

      // act
      final result = CensusDatasetModel.fromJson(json);

      // assert
      expect(result.description, isNull);
    });

    test('should handle null description in copyWith', () {
      // arrange
      const nullDescriptionModel = CensusDatasetModel(
        id: 101,
        topicID: 1,
        topic: 'Penduduk',
        eventID: 1,
        name: 'Jumlah Penduduk',
      );

      // act
      final result = nullDescriptionModel.copyWith();

      // assert
      expect(result.description, isNull);
    });
  });
}