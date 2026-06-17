import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('StrategicIndicatorModel', () {
    const tId = 10;
    const tVariableID = 29;
    const tCategoryID = 2;
    const tCsaSubjectID = 535;
    const tTitle = 'Ekspor, Januari 2021';
    const tName = 'Ekspor di Provinsi Sulawesi Tengah, Januari 2021';
    const tDataSource = 'Berita Resmi Statistik';
    const tValue = 606.29;
    const tUnit = 'Juta US\$';
    const tHashID = 'MjkjMg==';
    const tPeriod = 'Januari 2021';

    const tModel = StrategicIndicatorModel(
      id: tId,
      variableID: tVariableID,
      categoryID: tCategoryID,
      csaSubjectID: tCsaSubjectID,
      title: tTitle,
      name: tName,
      dataSource: tDataSource,
      value: tValue,
      unit: tUnit,
      hashID: tHashID,
      period: tPeriod,
    );

    final tJson = <String, dynamic>{
      'indicator_id': tId,
      'var': tVariableID,
      'category': tCategoryID,
      'subject_csa': tCsaSubjectID,
      'title': tTitle,
      'name': tName,
      'data_source': tDataSource,
      'value': tValue,
      'unit': tUnit,
      'hash_id': tHashID,
      'periode': tPeriod,
    };

    group('fromJson', () {
      test('should return a valid model when all fields are present', () {
        // act
        final result = StrategicIndicatorModel.fromJson(tJson);

        // assert
        expect(result.id, equals(tId));
        expect(result.variableID, equals(tVariableID));
        expect(result.categoryID, equals(tCategoryID));
        expect(result.csaSubjectID, equals(tCsaSubjectID));
        expect(result.title, equals(tTitle));
        expect(result.name, equals(tName));
        expect(result.dataSource, equals(tDataSource));
        expect(result.value, equals(tValue));
        expect(result.unit, equals(tUnit));
        expect(result.hashID, equals(tHashID));
        expect(result.period, equals(tPeriod));
      });

      test('should parse integer value as double', () {
        // arrange
        final json = Map<String, dynamic>.from(tJson);
        json['value'] = 483662;

        // act
        final result = StrategicIndicatorModel.fromJson(json);

        // assert
        expect(result.value, equals(483662.0));
        expect(result.value, isA<double>());
      });

      test('should return model with null csaSubjectID when absent', () {
        // arrange
        final json = Map<String, dynamic>.from(tJson);
        json['subject_csa'] = null;

        // act
        final result = StrategicIndicatorModel.fromJson(json);

        // assert
        expect(result.csaSubjectID, isNull);
      });
    });

    group('toJson', () {
      test('should return a JSON map with all fields', () {
        // act
        final result = tModel.toJson();

        // assert
        expect(result, isA<JSON>());
        expect(result['indicator_id'], equals(tId));
        expect(result['var'], equals(tVariableID));
        expect(result['category'], equals(tCategoryID));
        expect(result['subject_csa'], equals(tCsaSubjectID));
        expect(result['title'], equals(tTitle));
        expect(result['name'], equals(tName));
        expect(result['data_source'], equals(tDataSource));
        expect(result['value'], equals(tValue));
        expect(result['unit'], equals(tUnit));
        expect(result['hash_id'], equals(tHashID));
        expect(result['periode'], equals(tPeriod));
      });

      test('should round-trip fromJson -> toJson correctly', () {
        // act
        final model = StrategicIndicatorModel.fromJson(tJson);
        final result = model.toJson();

        // assert
        expect(result['indicator_id'], equals(tJson['indicator_id']));
        expect(result['var'], equals(tJson['var']));
        expect(result['category'], equals(tJson['category']));
        expect(result['title'], equals(tJson['title']));
        expect(result['name'], equals(tJson['name']));
        expect(result['data_source'], equals(tJson['data_source']));
        expect(result['hash_id'], equals(tJson['hash_id']));
        expect(result['periode'], equals(tJson['periode']));
        expect(result['unit'], equals(tJson['unit']));
      });
    });

    group('copyWith', () {
      test('should return updated model with new id', () {
        // act
        final result = tModel.copyWith(id: 999);

        // assert
        expect(result.id, equals(999));
        expect(result.title, equals(tTitle));
        expect(result.value, equals(tValue));
      });

      test('should return updated model with new value', () {
        // act
        final result = tModel.copyWith(value: 100.5);

        // assert
        expect(result.value, equals(100.5));
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
      });

      test('should return updated model with new unit', () {
        // act
        final result = tModel.copyWith(unit: 'Persen');

        // assert
        expect(result.unit, equals('Persen'));
        expect(result.id, equals(tId));
      });

      test('should update nullable csaSubjectID via ValueGetter', () {
        // act
        final result = tModel.copyWith(csaSubjectID: () => 999);

        // assert
        expect(result.csaSubjectID, equals(999));
        expect(result.id, equals(tId));
      });

      test(
        'should set csaSubjectID to null via ValueGetter returning null',
        () {
          // act
          final result = tModel.copyWith(csaSubjectID: () => null);

          // assert
          expect(result.csaSubjectID, isNull);
        },
      );

      test('should preserve all unchanged fields', () {
        // act
        final result = tModel.copyWith(period: 'Februari 2021');

        // assert
        expect(result.period, equals('Februari 2021'));
        expect(result.id, equals(tId));
        expect(result.variableID, equals(tVariableID));
        expect(result.categoryID, equals(tCategoryID));
        expect(result.title, equals(tTitle));
        expect(result.name, equals(tName));
        expect(result.dataSource, equals(tDataSource));
        expect(result.value, equals(tValue));
        expect(result.unit, equals(tUnit));
        expect(result.hashID, equals(tHashID));
      });

      test('should return identical values when no parameters provided', () {
        // act
        final result = tModel.copyWith();

        // assert
        expect(result.id, equals(tId));
        expect(result.variableID, equals(tVariableID));
        expect(result.categoryID, equals(tCategoryID));
        expect(result.csaSubjectID, equals(tCsaSubjectID));
        expect(result.title, equals(tTitle));
        expect(result.name, equals(tName));
        expect(result.dataSource, equals(tDataSource));
        expect(result.value, equals(tValue));
        expect(result.unit, equals(tUnit));
        expect(result.hashID, equals(tHashID));
        expect(result.period, equals(tPeriod));
        expect(result, equals(tModel));
      });
    });

    group('equality', () {
      test('should be equal when all properties are the same', () {
        // arrange
        const model2 = StrategicIndicatorModel(
          id: tId,
          variableID: tVariableID,
          categoryID: tCategoryID,
          csaSubjectID: tCsaSubjectID,
          title: tTitle,
          name: tName,
          dataSource: tDataSource,
          value: tValue,
          unit: tUnit,
          hashID: tHashID,
          period: tPeriod,
        );

        // assert
        expect(tModel, equals(model2));
        expect(tModel.hashCode, equals(model2.hashCode));
      });

      test('should not be equal when id is different', () {
        // arrange
        const other = StrategicIndicatorModel(
          id: 999,
          variableID: tVariableID,
          categoryID: tCategoryID,
          title: tTitle,
          name: tName,
          dataSource: tDataSource,
          value: tValue,
          unit: tUnit,
          hashID: tHashID,
          period: tPeriod,
        );

        // assert
        expect(tModel, isNot(equals(other)));
      });
    });

    group('inheritance', () {
      test('should be a subclass of StrategicIndicator', () {
        expect(tModel, isA<StrategicIndicator>());
      });

      test('should be a subclass of BaseEntity', () {
        expect(tModel, isA<BaseEntity>());
      });
    });
  });
}
