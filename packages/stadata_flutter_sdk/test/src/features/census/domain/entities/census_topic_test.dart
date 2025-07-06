import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  const tCensusTopic = CensusTopic(
    id: 16,
    topic: 'Number and Distribution of Population',
    eventID: 'sp2022',
    eventName: 'Long Form Sensus Penduduk 2020',
  );

  group('CensusTopic', () {
    test('should be a subclass of BaseEntity', () {
      // assert
      expect(tCensusTopic, isA<BaseEntity>());
    });

    test('should return correct props', () {
      // act
      final props = tCensusTopic.props;

      // assert
      expect(
        props,
        [
          16,
          'Number and Distribution of Population',
          'sp2022',
          'Long Form Sensus Penduduk 2020',
        ],
      );
    });

    test('should support equality comparison', () {
      // arrange
      const anotherCensusTopic = CensusTopic(
        id: 16,
        topic: 'Number and Distribution of Population',
        eventID: 'sp2022',
        eventName: 'Long Form Sensus Penduduk 2020',
      );

      // assert
      expect(tCensusTopic, equals(anotherCensusTopic));
    });

    test('should not be equal when properties differ', () {
      // arrange
      const differentCensusTopic = CensusTopic(
        id: 17,
        topic: 'Housing and Household Characteristics',
        eventID: 'sp2020',
        eventName: 'Sensus Penduduk 2020',
      );

      // assert
      expect(tCensusTopic, isNot(equals(differentCensusTopic)));
    });

    test('should handle different topic categories', () {
      // arrange
      const housingTopic = CensusTopic(
        id: 25,
        topic: 'Housing and Household Characteristics',
        eventID: 'sp2020',
        eventName: 'Sensus Penduduk 2020',
      );

      // assert
      expect(housingTopic.topic, 'Housing and Household Characteristics');
      expect(housingTopic.id, 25);
    });

    test('should handle different event IDs', () {
      // arrange
      const differentEventTopic = CensusTopic(
        id: 16,
        topic: 'Number and Distribution of Population',
        eventID: 'sp2010',
        eventName: 'Sensus Penduduk 2010',
      );

      // assert
      expect(differentEventTopic.eventID, 'sp2010');
      expect(differentEventTopic.eventName, 'Sensus Penduduk 2010');
    });

    test('should handle large ID numbers', () {
      // arrange
      const topicWithLargeId = CensusTopic(
        id: 999999,
        topic: 'Test Topic',
        eventID: 'test2023',
        eventName: 'Test Census 2023',
      );

      // assert
      expect(topicWithLargeId.id, 999999);
      expect(topicWithLargeId.id, greaterThan(1000));
    });

    test('should handle minimal ID numbers', () {
      // arrange
      const topicWithMinimalId = CensusTopic(
        id: 1,
        topic: 'Basic Population Count',
        eventID: 'sp1971',
        eventName: 'Sensus Penduduk 1971',
      );

      // assert
      expect(topicWithMinimalId.id, 1);
      expect(topicWithMinimalId.id, greaterThan(0));
    });
  });
}
