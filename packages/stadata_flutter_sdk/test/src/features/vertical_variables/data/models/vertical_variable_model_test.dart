import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('VerticalVariableModel', () {
    const tId = 7211;
    const tTitle = 'Banggai Laut';
    const tItemID = 249;
    const tGroupID = 1;
    const tGroupName = 'Province';

    const tModel = VerticalVariableModel(
      id: tId,
      title: tTitle,
      itemID: tItemID,
      groupID: tGroupID,
      groupName: tGroupName,
    );

    final tJson = <String, dynamic>{
      'kode_ver_id': tId,
      'vervar': tTitle,
      'item_ver_id': tItemID,
      'group_ver_id': tGroupID,
      'name_group_ver_id': tGroupName,
    };

    group('fromJson', () {
      test('should return a valid model when all fields are present', () {
        // act
        final result = VerticalVariableModel.fromJson(tJson);

        // assert
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.itemID, equals(tItemID));
        expect(result.groupID, equals(tGroupID));
        expect(result.groupName, equals(tGroupName));
      });

      test(
        'should return model with null groupID and groupName when absent',
        () {
          // arrange
          final json = <String, dynamic>{
            'kode_ver_id': tId,
            'vervar': tTitle,
            'item_ver_id': tItemID,
            'group_ver_id': null,
            'name_group_ver_id': null,
          };

          // act
          final result = VerticalVariableModel.fromJson(json);

          // assert
          expect(result.groupID, isNull);
          expect(result.groupName, isNull);
          expect(result.id, equals(tId));
          expect(result.title, equals(tTitle));
          expect(result.itemID, equals(tItemID));
        },
      );
    });

    group('toJson', () {
      test('should return a JSON map with all fields', () {
        // act
        final result = tModel.toJson();

        // assert
        expect(result, isA<JSON>());
        expect(result['kode_ver_id'], equals(tId));
        expect(result['vervar'], equals(tTitle));
        expect(result['item_ver_id'], equals(tItemID));
        expect(result['group_ver_id'], equals(tGroupID));
        expect(result['name_group_ver_id'], equals(tGroupName));
      });

      test('should round-trip fromJson -> toJson correctly', () {
        // act
        final model = VerticalVariableModel.fromJson(tJson);
        final result = model.toJson();

        // assert
        expect(result, equals(tJson));
      });

      test('should include null values for nullable fields', () {
        // arrange
        const modelNoGroup = VerticalVariableModel(
          id: tId,
          title: tTitle,
          itemID: tItemID,
        );

        // act
        final result = modelNoGroup.toJson();

        // assert
        expect(result['group_ver_id'], isNull);
        expect(result['name_group_ver_id'], isNull);
      });
    });

    group('copyWith', () {
      test('should return updated model with new id', () {
        // act
        final result = tModel.copyWith(id: 9999);

        // assert
        expect(result.id, equals(9999));
        expect(result.title, equals(tTitle));
        expect(result.itemID, equals(tItemID));
      });

      test('should return updated model with new title', () {
        // act
        final result = tModel.copyWith(title: 'New Title');

        // assert
        expect(result.title, equals('New Title'));
        expect(result.id, equals(tId));
      });

      test('should update nullable groupID via ValueGetter', () {
        // act
        final result = tModel.copyWith(groupID: () => 5);

        // assert
        expect(result.groupID, equals(5));
        expect(result.id, equals(tId));
      });

      test('should set groupID to null via ValueGetter returning null', () {
        // act
        final result = tModel.copyWith(groupID: () => null);

        // assert
        expect(result.groupID, isNull);
        expect(result.id, equals(tId));
      });

      test('should update nullable groupName via ValueGetter', () {
        // act
        final result = tModel.copyWith(groupName: () => 'Regency');

        // assert
        expect(result.groupName, equals('Regency'));
        expect(result.id, equals(tId));
      });

      test('should set groupName to null via ValueGetter returning null', () {
        // act
        final result = tModel.copyWith(groupName: () => null);

        // assert
        expect(result.groupName, isNull);
        expect(result.id, equals(tId));
      });

      test('should preserve all unchanged fields', () {
        // act
        final result = tModel.copyWith(itemID: 300);

        // assert
        expect(result.itemID, equals(300));
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.groupID, equals(tGroupID));
        expect(result.groupName, equals(tGroupName));
      });

      test('should return identical values when no parameters provided', () {
        // act
        final result = tModel.copyWith();

        // assert
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.itemID, equals(tItemID));
        expect(result.groupID, equals(tGroupID));
        expect(result.groupName, equals(tGroupName));
        expect(result, equals(tModel));
      });
    });

    group('equality', () {
      test('should be equal when all properties are the same', () {
        // arrange
        const model2 = VerticalVariableModel(
          id: tId,
          title: tTitle,
          itemID: tItemID,
          groupID: tGroupID,
          groupName: tGroupName,
        );

        // assert
        expect(tModel, equals(model2));
        expect(tModel.hashCode, equals(model2.hashCode));
      });

      test('should not be equal when id is different', () {
        // arrange
        const other = VerticalVariableModel(
          id: 9999,
          title: tTitle,
          itemID: tItemID,
        );

        // assert
        expect(tModel, isNot(equals(other)));
      });
    });

    group('inheritance', () {
      test('should be a subclass of VerticalVariable', () {
        expect(tModel, isA<VerticalVariable>());
      });

      test('should be a subclass of BaseEntity', () {
        expect(tModel, isA<BaseEntity>());
      });
    });
  });
}
