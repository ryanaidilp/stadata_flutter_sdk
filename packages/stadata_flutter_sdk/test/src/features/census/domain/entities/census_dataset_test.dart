import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tCensusDataset = CensusDataset(
    id: 41,
    topicID: 16,
    topic: 'Population',
    eventID: 2020,
    name: 'Population by Age Group and Gender',
    description: 'Dataset containing population data categorized by age groups and gender distribution',
  );

  group('CensusDataset', () {
    test('should be a subclass of BaseEntity', () {
      // assert
      expect(tCensusDataset, isA<BaseEntity>());
    });

    test('should return correct props', () {
      // act
      final props = tCensusDataset.props;

      // assert
      expect(
        props,
        [
          41,
          16,
          'Population',
          2020,
          'Population by Age Group and Gender',
          'Dataset containing population data categorized by age groups and gender distribution',
        ],
      );
    });

    test('should support equality comparison', () {
      // arrange
      const anotherCensusDataset = CensusDataset(
        id: 41,
        topicID: 16,
        topic: 'Population',
        eventID: 2020,
        name: 'Population by Age Group and Gender',
        description: 'Dataset containing population data categorized by age groups and gender distribution',
      );

      // assert
      expect(tCensusDataset, equals(anotherCensusDataset));
    });

    test('should not be equal when properties differ', () {
      // arrange
      const differentCensusDataset = CensusDataset(
        id: 42,
        topicID: 17,
        topic: 'Housing',
        eventID: 2020,
        name: 'Housing Characteristics',
        description: 'Dataset containing housing and household characteristics',
      );

      // assert
      expect(tCensusDataset, isNot(equals(differentCensusDataset)));
    });

    test('should handle nullable description', () {
      // arrange
      const datasetWithoutDescription = CensusDataset(
        id: 43,
        topicID: 18,
        topic: 'Economy',
        eventID: 2020,
        name: 'Economic Activities',
      );

      // assert
      expect(datasetWithoutDescription.description, isNull);
      expect(datasetWithoutDescription.name, 'Economic Activities');
    });

    test('should handle different topic categories', () {
      // arrange
      const housingDataset = CensusDataset(
        id: 50,
        topicID: 25,
        topic: 'Housing',
        eventID: 2020,
        name: 'Housing Units by Type',
        description: 'Classification of housing units by structural type',
      );

      // assert
      expect(housingDataset.topic, 'Housing');
      expect(housingDataset.topicID, 25);
    });

    test('should handle different event IDs', () {
      // arrange
      const dataset2010 = CensusDataset(
        id: 30,
        topicID: 16,
        topic: 'Population',
        eventID: 2010,
        name: 'Population Count 2010',
        description: 'Basic population count from 2010 census',
      );

      // assert
      expect(dataset2010.eventID, 2010);
      expect(dataset2010.name.contains('2010'), true);
    });

    test('should handle large ID numbers', () {
      // arrange
      const datasetWithLargeId = CensusDataset(
        id: 999999,
        topicID: 888888,
        topic: 'Special Topic',
        eventID: 2025,
        name: 'Special Dataset',
        description: 'A dataset with very large ID numbers',
      );

      // assert
      expect(datasetWithLargeId.id, 999999);
      expect(datasetWithLargeId.topicID, 888888);
      expect(datasetWithLargeId.id, greaterThan(1000));
    });

    test('should handle empty description', () {
      // arrange
      const datasetWithEmptyDescription = CensusDataset(
        id: 60,
        topicID: 20,
        topic: 'Agriculture',
        eventID: 2023,
        name: 'Agricultural Census',
        description: '',
      );

      // assert
      expect(datasetWithEmptyDescription.description, '');
      expect(datasetWithEmptyDescription.description?.isEmpty, true);
    });

    test('should handle long dataset names', () {
      // arrange
      const datasetWithLongName = CensusDataset(
        id: 70,
        topicID: 30,
        topic: 'Detailed Demographics',
        eventID: 2020,
        name: 'Comprehensive Population Demographics Including Age, Gender, Education, Employment Status, and Marital Status',
        description: 'A very detailed dataset covering multiple demographic dimensions',
      );

      // assert
      expect(datasetWithLongName.name.length, greaterThan(50));
      expect(datasetWithLongName.topic, 'Detailed Demographics');
    });

    test('should handle future event IDs', () {
      // arrange
      const futureDataset = CensusDataset(
        id: 80,
        topicID: 40,
        topic: 'Future Census',
        eventID: 2030,
        name: 'Projected Census Data',
        description: 'Dataset for future census planning',
      );

      // assert
      expect(futureDataset.eventID, 2030);
      expect(futureDataset.eventID, greaterThan(2025));
    });
  });
}
