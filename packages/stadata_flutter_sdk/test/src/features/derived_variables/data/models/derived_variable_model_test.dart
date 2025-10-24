import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('DerivedVariableModel', () {
    const tId = 3200;
    const tName = 'DKI Jakarta';
    const tGroupID = 1;
    const tGroupName = 'Wilayah Provinsi';

    const tDerivedVariableModel = DerivedVariableModel(
      id: tId,
      name: tName,
      groupID: tGroupID,
      groupName: tGroupName,
    );

    const tDerivedVariableEntity = DerivedVariable(
      id: tId,
      name: tName,
      groupID: tGroupID,
      groupName: tGroupName,
    );

    final tJson = <String, dynamic>{
      'turvar_id': tId,
      'turvar': tName,
      'group_turvar_id': tGroupID,
      'name_group_turvar': tGroupName,
    };

    group('fromJson', () {
      test('should return a valid DerivedVariableModel from JSON', () {
        // act
        final result = DerivedVariableModel.fromJson(tJson);

        // assert
        expect(result, equals(tDerivedVariableModel));
        expect(result.id, equals(tId));
        expect(result.name, equals(tName));
        expect(result.groupID, equals(tGroupID));
        expect(result.groupName, equals(tGroupName));
      });

      test('should handle int groupID correctly', () {
        // arrange
        final json = <String, dynamic>{
          'turvar_id': 4100,
          'turvar': 'Pertanian',
          'group_turvar_id': 2,
          'name_group_turvar': 'Sektor Ekonomi',
        };

        // act
        final result = DerivedVariableModel.fromJson(json);

        // assert
        expect(result.id, equals(4100));
        expect(result.name, equals('Pertanian'));
        expect(result.groupID, equals(2));
        expect(result.groupID, isA<int>());
        expect(result.groupName, equals('Sektor Ekonomi'));
      });

      test('should handle different values correctly', () {
        // arrange
        final json = <String, dynamic>{
          'turvar_id': 3201,
          'turvar': 'Jawa Barat',
          'group_turvar_id': 1,
          'name_group_turvar': 'Wilayah Provinsi',
        };

        // act
        final result = DerivedVariableModel.fromJson(json);

        // assert
        expect(result.id, equals(3201));
        expect(result.name, equals('Jawa Barat'));
        expect(result.groupID, equals(1));
        expect(result.groupName, equals('Wilayah Provinsi'));
      });
    });

    group('toJson', () {
      test('should return a JSON map containing proper data', () {
        // act
        final result = tDerivedVariableModel.toJson();

        // assert
        expect(result, equals(tJson));
        expect(result['turvar_id'], equals(tId));
        expect(result['turvar'], equals(tName));
        expect(result['group_turvar_id'], equals(tGroupID));
        expect(result['name_group_turvar'], equals(tGroupName));
      });

      test('should return JSON matching the BPS API format', () {
        // act
        final result = tDerivedVariableModel.toJson();

        // assert
        expect(result, isA<JSON>());
        expect(result.containsKey('turvar_id'), isTrue);
        expect(result.containsKey('turvar'), isTrue);
        expect(result.containsKey('group_turvar_id'), isTrue);
        expect(result.containsKey('name_group_turvar'), isTrue);
        expect(result.keys.length, equals(4));
      });

      test('should preserve int type for groupID', () {
        // act
        final result = tDerivedVariableModel.toJson();

        // assert
        expect(result['group_turvar_id'], isA<int>());
        expect(result['group_turvar_id'], equals(1));
      });
    });

    group('fromEntity', () {
      test(
        'should create DerivedVariableModel from DerivedVariable entity',
        () {
          // act
          final result = DerivedVariableModel.fromEntity(
            tDerivedVariableEntity,
          );

          // assert
          expect(result, equals(tDerivedVariableModel));
          expect(result, isA<DerivedVariableModel>());
          expect(result.id, equals(tDerivedVariableEntity.id));
          expect(result.name, equals(tDerivedVariableEntity.name));
          expect(result.groupID, equals(tDerivedVariableEntity.groupID));
          expect(result.groupName, equals(tDerivedVariableEntity.groupName));
        },
      );

      test(
        'should preserve all entity properties including int groupID',
        () {
          // arrange
          const entity = DerivedVariable(
            id: 4102,
            name: 'Perdagangan',
            groupID: 2,
            groupName: 'Sektor Ekonomi',
          );

          // act
          final result = DerivedVariableModel.fromEntity(entity);

          // assert
          expect(result.id, equals(entity.id));
          expect(result.name, equals(entity.name));
          expect(result.groupID, equals(entity.groupID));
          expect(result.groupID, isA<int>());
          expect(result.groupName, equals(entity.groupName));
        },
      );
    });

    group('copyWith', () {
      test('should return a new instance with updated id', () {
        // act
        final result = tDerivedVariableModel.copyWith(id: 3201);

        // assert
        expect(result.id, equals(3201));
        expect(result.name, equals(tName));
        expect(result.groupID, equals(tGroupID));
        expect(result.groupName, equals(tGroupName));
        expect(result, isNot(same(tDerivedVariableModel)));
      });

      test('should return a new instance with updated name', () {
        // act
        final result = tDerivedVariableModel.copyWith(name: 'Jawa Barat');

        // assert
        expect(result.id, equals(tId));
        expect(result.name, equals('Jawa Barat'));
        expect(result.groupID, equals(tGroupID));
        expect(result.groupName, equals(tGroupName));
        expect(result, isNot(same(tDerivedVariableModel)));
      });

      test('should return a new instance with updated groupID', () {
        // act
        final result = tDerivedVariableModel.copyWith(groupID: 2);

        // assert
        expect(result.id, equals(tId));
        expect(result.name, equals(tName));
        expect(result.groupID, equals(2));
        expect(result.groupName, equals(tGroupName));
        expect(result, isNot(same(tDerivedVariableModel)));
      });

      test('should return a new instance with updated groupName', () {
        // act
        final result = tDerivedVariableModel.copyWith(
          groupName: 'Sektor Ekonomi',
        );

        // assert
        expect(result.id, equals(tId));
        expect(result.name, equals(tName));
        expect(result.groupID, equals(tGroupID));
        expect(result.groupName, equals('Sektor Ekonomi'));
        expect(result, isNot(same(tDerivedVariableModel)));
      });

      test('should return a new instance with all fields updated', () {
        // act
        final result = tDerivedVariableModel.copyWith(
          id: 4100,
          name: 'Pertanian',
          groupID: 2,
          groupName: 'Sektor Ekonomi',
        );

        // assert
        expect(result.id, equals(4100));
        expect(result.name, equals('Pertanian'));
        expect(result.groupID, equals(2));
        expect(result.groupName, equals('Sektor Ekonomi'));
        expect(result, isNot(same(tDerivedVariableModel)));
      });

      test(
        'should return a copy with same values when no parameters provided',
        () {
          // act
          final result = tDerivedVariableModel.copyWith();

          // assert
          expect(result.id, equals(tId));
          expect(result.name, equals(tName));
          expect(result.groupID, equals(tGroupID));
          expect(result.groupName, equals(tGroupName));
          expect(result, isNot(same(tDerivedVariableModel)));
          expect(result, equals(tDerivedVariableModel));
        },
      );
    });

    group('equality', () {
      test('should be equal when properties are the same', () {
        // arrange
        const model1 = DerivedVariableModel(
          id: 3200,
          name: 'DKI Jakarta',
          groupID: 1,
          groupName: 'Wilayah Provinsi',
        );
        const model2 = DerivedVariableModel(
          id: 3200,
          name: 'DKI Jakarta',
          groupID: 1,
          groupName: 'Wilayah Provinsi',
        );

        // assert
        expect(model1, equals(model2));
        expect(model1.hashCode, equals(model2.hashCode));
      });

      test('should not be equal when id is different', () {
        // arrange
        const model1 = DerivedVariableModel(
          id: 3200,
          name: 'DKI Jakarta',
          groupID: 1,
          groupName: 'Wilayah Provinsi',
        );
        const model2 = DerivedVariableModel(
          id: 3201,
          name: 'DKI Jakarta',
          groupID: 1,
          groupName: 'Wilayah Provinsi',
        );

        // assert
        expect(model1, isNot(equals(model2)));
      });

      test('should not be equal when groupID string is different', () {
        // arrange
        const model1 = DerivedVariableModel(
          id: 3200,
          name: 'Region',
          groupID: 1,
          groupName: 'Wilayah Provinsi',
        );
        const model2 = DerivedVariableModel(
          id: 3200,
          name: 'Region',
          groupID: 2,
          groupName: 'Wilayah Provinsi',
        );

        // assert
        expect(model1, isNot(equals(model2)));
      });
    });

    group('inheritance', () {
      test('should be a subclass of DerivedVariable', () {
        // assert
        expect(tDerivedVariableModel, isA<DerivedVariable>());
      });

      test('should be a subclass of BaseEntity', () {
        // assert
        expect(tDerivedVariableModel, isA<BaseEntity>());
      });
    });
  });
}
