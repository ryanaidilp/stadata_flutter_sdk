import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('VariableModel', () {
    const tId = 192;
    const tTitle =
        'Persentase Penduduk Miskin (P0) Menurut Provinsi dan Daerah';
    const tSubjectID = 23;
    const tSubjectName = 'Kemiskinan dan Ketimpangan';
    const tVerticalVariableID = 1;
    const tGraphName = 'bar';
    const tUnit = 'Persen';
    const tNotes = 'Plain notes without HTML';
    const tCsaSubjectID = 523;
    const tCsaSubjectName = 'Konsumsi dan Pendapatan';
    const tType = 1;
    const tDerivedPeriodID = 6;
    const tDerivedVariableID = 85;

    const tModel = VariableModel(
      id: tId,
      notes: tNotes,
      subjectID: tSubjectID,
      subjectName: tSubjectName,
      title: tTitle,
      verticalVariableID: tVerticalVariableID,
      graphName: tGraphName,
      unit: tUnit,
      csaSubjectID: tCsaSubjectID,
      csaSubjectName: tCsaSubjectName,
      type: tType,
      derivedPeriodID: tDerivedPeriodID,
      derivedVariableID: tDerivedVariableID,
    );

    final tJson = <String, dynamic>{
      'var_id': tId,
      'title': tTitle,
      'sub_id': tSubjectID,
      'sub_name': tSubjectName,
      'subcsa_id': tCsaSubjectID,
      'subcsa_name': tCsaSubjectName,
      'notes': tNotes,
      'vertical': tVerticalVariableID,
      'unit': tUnit,
      'graph_name': tGraphName,
      'turth': tDerivedPeriodID,
      'turvar': tDerivedVariableID,
      'type': tType,
    };

    group('fromJson', () {
      test('should return a valid model when all fields are present', () {
        // act
        final result = VariableModel.fromJson(tJson);

        // assert
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.subjectID, equals(tSubjectID));
        expect(result.subjectName, equals(tSubjectName));
        expect(result.verticalVariableID, equals(tVerticalVariableID));
        expect(result.graphName, equals(tGraphName));
        expect(result.unit, equals(tUnit));
        expect(result.csaSubjectID, equals(tCsaSubjectID));
        expect(result.csaSubjectName, equals(tCsaSubjectName));
        expect(result.type, equals(tType));
        expect(result.derivedPeriodID, equals(tDerivedPeriodID));
        expect(result.derivedVariableID, equals(tDerivedVariableID));
      });

      test('should default graphName and unit to empty string when null', () {
        // arrange
        final json = Map<String, dynamic>.from(tJson);
        json['graph_name'] = null;
        json['unit'] = null;

        // act
        final result = VariableModel.fromJson(json);

        // assert
        expect(result.graphName, equals(''));
        expect(result.unit, equals(''));
      });

      test('should return model with null optional fields when absent', () {
        // arrange
        final json = <String, dynamic>{
          'var_id': tId,
          'title': tTitle,
          'sub_id': tSubjectID,
          'sub_name': tSubjectName,
          'notes': tNotes,
          'vertical': tVerticalVariableID,
          'unit': tUnit,
          'graph_name': tGraphName,
          'subcsa_id': null,
          'subcsa_name': null,
          'type': null,
          'turth': null,
          'turvar': null,
        };

        // act
        final result = VariableModel.fromJson(json);

        // assert
        expect(result.csaSubjectID, isNull);
        expect(result.csaSubjectName, isNull);
        expect(result.type, isNull);
        expect(result.derivedPeriodID, isNull);
        expect(result.derivedVariableID, isNull);
      });

      test('should convert HTML entities in notes', () {
        // arrange
        final json = Map<String, dynamic>.from(tJson);
        json['notes'] = '&lt;p&gt;Some HTML&lt;/p&gt;';

        // act
        final result = VariableModel.fromJson(json);

        // assert
        expect(result.notes, equals('<p>Some HTML</p>'));
      });
    });

    group('toJson', () {
      test('should return a JSON map with all fields', () {
        // act
        final result = tModel.toJson();

        // assert
        expect(result, isA<JSON>());
        expect(result['var_id'], equals(tId));
        expect(result['title'], equals(tTitle));
        expect(result['sub_id'], equals(tSubjectID));
        expect(result['sub_name'], equals(tSubjectName));
        expect(result['vertical'], equals(tVerticalVariableID));
        expect(result['graph_name'], equals(tGraphName));
        expect(result['unit'], equals(tUnit));
        expect(result['subcsa_id'], equals(tCsaSubjectID));
        expect(result['subcsa_name'], equals(tCsaSubjectName));
        expect(result['type'], equals(tType));
        expect(result['turth'], equals(tDerivedPeriodID));
        expect(result['turvar'], equals(tDerivedVariableID));
      });

      test('should include null values for nullable fields', () {
        // arrange
        const modelNoOptionals = VariableModel(
          id: tId,
          notes: tNotes,
          subjectID: tSubjectID,
          subjectName: tSubjectName,
          title: tTitle,
          verticalVariableID: tVerticalVariableID,
        );

        // act
        final result = modelNoOptionals.toJson();

        // assert
        expect(result['subcsa_id'], isNull);
        expect(result['subcsa_name'], isNull);
        expect(result['type'], isNull);
        expect(result['turth'], isNull);
        expect(result['turvar'], isNull);
      });
    });

    group('copyWith', () {
      test('should return updated model with new id', () {
        // act
        final result = tModel.copyWith(id: 999);

        // assert
        expect(result.id, equals(999));
        expect(result.title, equals(tTitle));
      });

      test('should return updated model with new title', () {
        // act
        final result = tModel.copyWith(title: 'New Title');

        // assert
        expect(result.title, equals('New Title'));
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
          expect(result.id, equals(tId));
        },
      );

      test('should update nullable csaSubjectName via ValueGetter', () {
        // act
        final result = tModel.copyWith(
          csaSubjectName: () => 'New CSA Subject',
        );

        // assert
        expect(result.csaSubjectName, equals('New CSA Subject'));
        expect(result.id, equals(tId));
      });

      test('should update nullable type via ValueGetter', () {
        // act
        final result = tModel.copyWith(type: () => 2);

        // assert
        expect(result.type, equals(2));
        expect(result.id, equals(tId));
      });

      test('should update nullable derivedPeriodID via ValueGetter', () {
        // act
        final result = tModel.copyWith(derivedPeriodID: () => 10);

        // assert
        expect(result.derivedPeriodID, equals(10));
        expect(result.id, equals(tId));
      });

      test('should update nullable derivedVariableID via ValueGetter', () {
        // act
        final result = tModel.copyWith(derivedVariableID: () => 20);

        // assert
        expect(result.derivedVariableID, equals(20));
        expect(result.id, equals(tId));
      });

      test('should preserve all unchanged fields', () {
        // act
        final result = tModel.copyWith(unit: 'Ribu Jiwa');

        // assert
        expect(result.unit, equals('Ribu Jiwa'));
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.subjectID, equals(tSubjectID));
        expect(result.subjectName, equals(tSubjectName));
        expect(result.verticalVariableID, equals(tVerticalVariableID));
        expect(result.graphName, equals(tGraphName));
        expect(result.notes, equals(tNotes));
        expect(result.csaSubjectID, equals(tCsaSubjectID));
        expect(result.csaSubjectName, equals(tCsaSubjectName));
        expect(result.type, equals(tType));
        expect(result.derivedPeriodID, equals(tDerivedPeriodID));
        expect(result.derivedVariableID, equals(tDerivedVariableID));
      });

      test('should return identical values when no parameters provided', () {
        // act
        final result = tModel.copyWith();

        // assert
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.subjectID, equals(tSubjectID));
        expect(result.subjectName, equals(tSubjectName));
        expect(result.verticalVariableID, equals(tVerticalVariableID));
        expect(result.graphName, equals(tGraphName));
        expect(result.unit, equals(tUnit));
        expect(result.notes, equals(tNotes));
        expect(result.csaSubjectID, equals(tCsaSubjectID));
        expect(result.csaSubjectName, equals(tCsaSubjectName));
        expect(result.type, equals(tType));
        expect(result.derivedPeriodID, equals(tDerivedPeriodID));
        expect(result.derivedVariableID, equals(tDerivedVariableID));
        expect(result, equals(tModel));
      });
    });

    group('equality', () {
      test('should be equal when all properties are the same', () {
        // arrange
        const model2 = VariableModel(
          id: tId,
          notes: tNotes,
          subjectID: tSubjectID,
          subjectName: tSubjectName,
          title: tTitle,
          verticalVariableID: tVerticalVariableID,
          graphName: tGraphName,
          unit: tUnit,
          csaSubjectID: tCsaSubjectID,
          csaSubjectName: tCsaSubjectName,
          type: tType,
          derivedPeriodID: tDerivedPeriodID,
          derivedVariableID: tDerivedVariableID,
        );

        // assert
        expect(tModel, equals(model2));
        expect(tModel.hashCode, equals(model2.hashCode));
      });

      test('should not be equal when id is different', () {
        // arrange
        const other = VariableModel(
          id: 9999,
          notes: tNotes,
          subjectID: tSubjectID,
          subjectName: tSubjectName,
          title: tTitle,
          verticalVariableID: tVerticalVariableID,
        );

        // assert
        expect(tModel, isNot(equals(other)));
      });
    });

    group('inheritance', () {
      test('should be a subclass of Variable', () {
        expect(tModel, isA<Variable>());
      });

      test('should be a subclass of BaseEntity', () {
        expect(tModel, isA<BaseEntity>());
      });
    });
  });
}
