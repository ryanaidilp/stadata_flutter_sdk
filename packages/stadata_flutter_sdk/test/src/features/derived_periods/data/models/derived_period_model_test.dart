import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('DerivedPeriodModel', () {
    const tId = 1;
    const tName = '2024';
    const tGroupID = 1;
    const tGroupName = 'Tahunan';

    const tDerivedPeriodModel = DerivedPeriodModel(
      id: tId,
      name: tName,
      groupID: tGroupID,
      groupName: tGroupName,
    );

    const tDerivedPeriodEntity = DerivedPeriod(
      id: tId,
      name: tName,
      groupID: tGroupID,
      groupName: tGroupName,
    );

    final tJson = <String, dynamic>{
      'turth_id': tId,
      'turth': tName,
      'group_turth_id': tGroupID,
      'name_group_turth': tGroupName,
    };

    group('fromJson', () {
      test('should return a valid DerivedPeriodModel from JSON', () {
        // act
        final result = DerivedPeriodModel.fromJson(tJson);

        // assert
        expect(result, equals(tDerivedPeriodModel));
        expect(result.id, equals(tId));
        expect(result.name, equals(tName));
        expect(result.groupID, equals(tGroupID));
        expect(result.groupName, equals(tGroupName));
      });

      test('should handle different values correctly', () {
        // arrange
        final json = <String, dynamic>{
          'turth_id': 4,
          'turth': '2021-Q4',
          'group_turth_id': 2,
          'name_group_turth': 'Triwulanan',
        };

        // act
        final result = DerivedPeriodModel.fromJson(json);

        // assert
        expect(result.id, equals(4));
        expect(result.name, equals('2021-Q4'));
        expect(result.groupID, equals(2));
        expect(result.groupName, equals('Triwulanan'));
      });
    });

    group('toJson', () {
      test('should return a JSON map containing proper data', () {
        // act
        final result = tDerivedPeriodModel.toJson();

        // assert
        expect(result, equals(tJson));
        expect(result['turth_id'], equals(tId));
        expect(result['turth'], equals(tName));
        expect(result['group_turth_id'], equals(tGroupID));
        expect(result['name_group_turth'], equals(tGroupName));
      });

      test('should return JSON matching the BPS API format', () {
        // act
        final result = tDerivedPeriodModel.toJson();

        // assert
        expect(result, isA<JSON>());
        expect(result.containsKey('turth_id'), isTrue);
        expect(result.containsKey('turth'), isTrue);
        expect(result.containsKey('group_turth_id'), isTrue);
        expect(result.containsKey('name_group_turth'), isTrue);
        expect(result.keys.length, equals(4));
      });
    });

    group('fromEntity', () {
      test('should create DerivedPeriodModel from DerivedPeriod entity', () {
        // act
        final result = DerivedPeriodModel.fromEntity(tDerivedPeriodEntity);

        // assert
        expect(result, equals(tDerivedPeriodModel));
        expect(result, isA<DerivedPeriodModel>());
        expect(result.id, equals(tDerivedPeriodEntity.id));
        expect(result.name, equals(tDerivedPeriodEntity.name));
        expect(result.groupID, equals(tDerivedPeriodEntity.groupID));
        expect(result.groupName, equals(tDerivedPeriodEntity.groupName));
      });

      test('should preserve all entity properties', () {
        // arrange
        const entity = DerivedPeriod(
          id: 3,
          name: '2022',
          groupID: 1,
          groupName: 'Tahunan',
        );

        // act
        final result = DerivedPeriodModel.fromEntity(entity);

        // assert
        expect(result.id, equals(entity.id));
        expect(result.name, equals(entity.name));
        expect(result.groupID, equals(entity.groupID));
        expect(result.groupName, equals(entity.groupName));
      });
    });

    group('copyWith', () {
      test('should return a new instance with updated id', () {
        // act
        final result = tDerivedPeriodModel.copyWith(id: 2);

        // assert
        expect(result.id, equals(2));
        expect(result.name, equals(tName));
        expect(result.groupID, equals(tGroupID));
        expect(result.groupName, equals(tGroupName));
        expect(result, isNot(same(tDerivedPeriodModel)));
      });

      test('should return a new instance with updated name', () {
        // act
        final result = tDerivedPeriodModel.copyWith(name: '2023');

        // assert
        expect(result.id, equals(tId));
        expect(result.name, equals('2023'));
        expect(result.groupID, equals(tGroupID));
        expect(result.groupName, equals(tGroupName));
        expect(result, isNot(same(tDerivedPeriodModel)));
      });

      test('should return a new instance with updated groupID', () {
        // act
        final result = tDerivedPeriodModel.copyWith(groupID: 2);

        // assert
        expect(result.id, equals(tId));
        expect(result.name, equals(tName));
        expect(result.groupID, equals(2));
        expect(result.groupName, equals(tGroupName));
        expect(result, isNot(same(tDerivedPeriodModel)));
      });

      test('should return a new instance with updated groupName', () {
        // act
        final result = tDerivedPeriodModel.copyWith(groupName: 'Triwulanan');

        // assert
        expect(result.id, equals(tId));
        expect(result.name, equals(tName));
        expect(result.groupID, equals(tGroupID));
        expect(result.groupName, equals('Triwulanan'));
        expect(result, isNot(same(tDerivedPeriodModel)));
      });

      test('should return a new instance with all fields updated', () {
        // act
        final result = tDerivedPeriodModel.copyWith(
          id: 5,
          name: '2021-Q3',
          groupID: 2,
          groupName: 'Triwulanan',
        );

        // assert
        expect(result.id, equals(5));
        expect(result.name, equals('2021-Q3'));
        expect(result.groupID, equals(2));
        expect(result.groupName, equals('Triwulanan'));
        expect(result, isNot(same(tDerivedPeriodModel)));
      });

      test(
        'should return a copy with same values when no parameters provided',
        () {
          // act
          final result = tDerivedPeriodModel.copyWith();

          // assert
          expect(result.id, equals(tId));
          expect(result.name, equals(tName));
          expect(result.groupID, equals(tGroupID));
          expect(result.groupName, equals(tGroupName));
          expect(result, isNot(same(tDerivedPeriodModel)));
          expect(result, equals(tDerivedPeriodModel));
        },
      );
    });

    group('equality', () {
      test('should be equal when properties are the same', () {
        // arrange
        const model1 = DerivedPeriodModel(
          id: 1,
          name: '2024',
          groupID: 1,
          groupName: 'Tahunan',
        );
        const model2 = DerivedPeriodModel(
          id: 1,
          name: '2024',
          groupID: 1,
          groupName: 'Tahunan',
        );

        // assert
        expect(model1, equals(model2));
        expect(model1.hashCode, equals(model2.hashCode));
      });

      test('should not be equal when id is different', () {
        // arrange
        const model1 = DerivedPeriodModel(
          id: 1,
          name: '2024',
          groupID: 1,
          groupName: 'Tahunan',
        );
        const model2 = DerivedPeriodModel(
          id: 2,
          name: '2024',
          groupID: 1,
          groupName: 'Tahunan',
        );

        // assert
        expect(model1, isNot(equals(model2)));
      });

      test('should not be equal when name is different', () {
        // arrange
        const model1 = DerivedPeriodModel(
          id: 1,
          name: '2024',
          groupID: 1,
          groupName: 'Tahunan',
        );
        const model2 = DerivedPeriodModel(
          id: 1,
          name: '2023',
          groupID: 1,
          groupName: 'Tahunan',
        );

        // assert
        expect(model1, isNot(equals(model2)));
      });

      test('should not be equal when groupID is different', () {
        // arrange
        const model1 = DerivedPeriodModel(
          id: 1,
          name: '2024',
          groupID: 1,
          groupName: 'Tahunan',
        );
        const model2 = DerivedPeriodModel(
          id: 1,
          name: '2024',
          groupID: 2,
          groupName: 'Tahunan',
        );

        // assert
        expect(model1, isNot(equals(model2)));
      });

      test('should not be equal when groupName is different', () {
        // arrange
        const model1 = DerivedPeriodModel(
          id: 1,
          name: '2024',
          groupID: 1,
          groupName: 'Tahunan',
        );
        const model2 = DerivedPeriodModel(
          id: 1,
          name: '2024',
          groupID: 1,
          groupName: 'Triwulanan',
        );

        // assert
        expect(model1, isNot(equals(model2)));
      });
    });

    group('inheritance', () {
      test('should be a subclass of DerivedPeriod', () {
        // assert
        expect(tDerivedPeriodModel, isA<DerivedPeriod>());
      });

      test('should be a subclass of BaseEntity', () {
        // assert
        expect(tDerivedPeriodModel, isA<BaseEntity>());
      });
    });
  });
}
