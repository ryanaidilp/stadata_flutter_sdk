import 'package:flutter_test/flutter_test.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

void main() {
  group('SdgIndicatorModel', () {
    const tId = 1238;
    const tTitle = 'Persentase Penduduk Miskin Di Daerah Tertinggal';
    const tGoal = 'sdgs_1';
    const tGoalName = '1. Tanpa Kemiskinan';
    const tSdgsId = '1.2.1*';
    const tSubjectId = 181;
    const tSubjectName = 'Tujuan Pembangunan Berkelanjutan Edisi I';
    const tUnit = 'Persen';
    const tDefinition = 'Definisi kemiskinan menurut BPS';
    const tNotes = '<p>Sumber: Susenas BPS</p>';
    const tVerticalVariableId = 333;
    const tGraphId = 1;
    const tGraphName = 'bar';
    const tMetaActivity =
        'https://sirusa.bps.go.id/sirusa/index.php/apiMetadata/KegiatanDasar?kode=131&tahun=2019';
    const tMetaVar =
        'https://sirusa.bps.go.id//sirusa/index.php/sensusMetadataKegiatan/indikator?indikator=1606';

    const tModel = SdgIndicatorModel(
      id: tId,
      title: tTitle,
      goal: tGoal,
      goalName: tGoalName,
      sdgsId: tSdgsId,
      subjectId: tSubjectId,
      subjectName: tSubjectName,
      unit: tUnit,
      definition: tDefinition,
      notes: tNotes,
      verticalVariableId: tVerticalVariableId,
      graphId: tGraphId,
      graphName: tGraphName,
      metaActivity: tMetaActivity,
      metaVar: tMetaVar,
    );

    final tJson = <String, dynamic>{
      'var_id': tId,
      'title': tTitle,
      'sdgs_goal': tGoal,
      'sdgs_goal_name': tGoalName,
      'sdgs_id': tSdgsId,
      'sub_id': tSubjectId,
      'sub_name': tSubjectName,
      'unit': tUnit,
      'def': tDefinition,
      'notes': tNotes,
      'vertical': tVerticalVariableId,
      'graph_id': tGraphId,
      'graph_name': tGraphName,
      'meta_activity': tMetaActivity,
      'meta_var': tMetaVar,
    };

    group('fromJson', () {
      test('should return a valid model when all fields are present', () {
        // act
        final result = SdgIndicatorModel.fromJson(tJson);

        // assert
        expect(result, equals(tModel));
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.goal, equals(tGoal));
        expect(result.goalName, equals(tGoalName));
        expect(result.sdgsId, equals(tSdgsId));
        expect(result.subjectId, equals(tSubjectId));
        expect(result.subjectName, equals(tSubjectName));
        expect(result.unit, equals(tUnit));
        expect(result.definition, equals(tDefinition));
        expect(result.notes, equals(tNotes));
        expect(result.verticalVariableId, equals(tVerticalVariableId));
        expect(result.graphId, equals(tGraphId));
        expect(result.graphName, equals(tGraphName));
        expect(result.metaActivity, equals(tMetaActivity));
        expect(result.metaVar, equals(tMetaVar));
      });

      test(
        'should return model with null metaActivity and metaVar when absent',
        () {
          // arrange
          final json = <String, dynamic>{
            'var_id': 1474,
            'title': 'Prevalensi Ketidakcukupan Konsumsi Pangan',
            'sdgs_goal': 'sdgs_2',
            'sdgs_goal_name': '2. Tanpa Kelaparan',
            'sdgs_id': '2.1.1*',
            'sub_id': 181,
            'sub_name': 'Tujuan Pembangunan Berkelanjutan Edisi I',
            'unit': 'Persen',
            'def': '',
            'notes': '',
            'vertical': 1,
            'graph_id': 1,
            'graph_name': 'bar',
            'meta_activity': null,
            'meta_var': null,
          };

          // act
          final result = SdgIndicatorModel.fromJson(json);

          // assert
          expect(result.metaActivity, isNull);
          expect(result.metaVar, isNull);
          expect(result.id, equals(1474));
          expect(result.definition, equals(''));
          expect(result.notes, equals(''));
        },
      );

      test('should default definition and notes to empty string when null', () {
        // arrange
        final json = <String, dynamic>{
          'var_id': 100,
          'title': 'Test Indicator',
          'sdgs_goal': 'sdgs_1',
          'sdgs_goal_name': '1. Tanpa Kemiskinan',
          'sdgs_id': '1.1.1',
          'sub_id': 10,
          'sub_name': 'Test Subject',
          'unit': 'Persen',
          'def': null,
          'notes': null,
          'vertical': 10,
          'graph_id': 1,
          'graph_name': 'bar',
          'meta_activity': null,
          'meta_var': null,
        };

        // act
        final result = SdgIndicatorModel.fromJson(json);

        // assert
        expect(result.definition, equals(''));
        expect(result.notes, equals(''));
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
        expect(result['sdgs_goal'], equals(tGoal));
        expect(result['sdgs_goal_name'], equals(tGoalName));
        expect(result['sdgs_id'], equals(tSdgsId));
        expect(result['sub_id'], equals(tSubjectId));
        expect(result['sub_name'], equals(tSubjectName));
        expect(result['unit'], equals(tUnit));
        expect(result['def'], equals(tDefinition));
        expect(result['notes'], equals(tNotes));
        expect(result['vertical'], equals(tVerticalVariableId));
        expect(result['graph_id'], equals(tGraphId));
        expect(result['graph_name'], equals(tGraphName));
        expect(result['meta_activity'], equals(tMetaActivity));
        expect(result['meta_var'], equals(tMetaVar));
      });

      test('should round-trip fromJson -> toJson correctly', () {
        // act
        final model = SdgIndicatorModel.fromJson(tJson);
        final result = model.toJson();

        // assert
        expect(result, equals(tJson));
      });

      test('should include null values for nullable fields', () {
        // arrange
        const modelWithNulls = SdgIndicatorModel(
          id: tId,
          title: tTitle,
          goal: tGoal,
          goalName: tGoalName,
          sdgsId: tSdgsId,
          subjectId: tSubjectId,
          subjectName: tSubjectName,
          unit: tUnit,
          definition: tDefinition,
          notes: tNotes,
          verticalVariableId: tVerticalVariableId,
          graphId: tGraphId,
          graphName: tGraphName,
        );

        // act
        final result = modelWithNulls.toJson();

        // assert
        expect(result['meta_activity'], isNull);
        expect(result['meta_var'], isNull);
      });
    });

    group('copyWith', () {
      test('should return updated model with new id', () {
        // act
        final result = tModel.copyWith(id: 9999);

        // assert
        expect(result.id, equals(9999));
        expect(result.title, equals(tTitle));
        expect(result.goal, equals(tGoal));
      });

      test('should return updated model with new title', () {
        // act
        final result = tModel.copyWith(title: 'New Title');

        // assert
        expect(result.title, equals('New Title'));
        expect(result.id, equals(tId));
      });

      test('should return updated model with new nullable fields', () {
        // act
        final result = tModel.copyWith(
          metaActivity: 'https://new-meta-activity.url',
          metaVar: 'https://new-meta-var.url',
        );

        // assert
        expect(result.metaActivity, equals('https://new-meta-activity.url'));
        expect(result.metaVar, equals('https://new-meta-var.url'));
        expect(result.id, equals(tId));
      });

      test('should preserve all unchanged fields', () {
        // act
        final result = tModel.copyWith(graphName: 'line');

        // assert
        expect(result.graphName, equals('line'));
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.goal, equals(tGoal));
        expect(result.goalName, equals(tGoalName));
        expect(result.sdgsId, equals(tSdgsId));
        expect(result.subjectId, equals(tSubjectId));
        expect(result.subjectName, equals(tSubjectName));
        expect(result.unit, equals(tUnit));
        expect(result.definition, equals(tDefinition));
        expect(result.notes, equals(tNotes));
        expect(result.verticalVariableId, equals(tVerticalVariableId));
        expect(result.graphId, equals(tGraphId));
        expect(result.metaActivity, equals(tMetaActivity));
        expect(result.metaVar, equals(tMetaVar));
      });

      test('should return identical values when no parameters provided', () {
        // act
        final result = tModel.copyWith();

        // assert
        expect(result.id, equals(tId));
        expect(result.title, equals(tTitle));
        expect(result.goal, equals(tGoal));
        expect(result.goalName, equals(tGoalName));
        expect(result.sdgsId, equals(tSdgsId));
        expect(result.subjectId, equals(tSubjectId));
        expect(result.subjectName, equals(tSubjectName));
        expect(result.unit, equals(tUnit));
        expect(result.definition, equals(tDefinition));
        expect(result.notes, equals(tNotes));
        expect(result.verticalVariableId, equals(tVerticalVariableId));
        expect(result.graphId, equals(tGraphId));
        expect(result.graphName, equals(tGraphName));
        expect(result.metaActivity, equals(tMetaActivity));
        expect(result.metaVar, equals(tMetaVar));
        expect(result, equals(tModel));
      });
    });

    group('equality', () {
      test('should be equal when all properties are the same', () {
        // arrange
        const model2 = SdgIndicatorModel(
          id: tId,
          title: tTitle,
          goal: tGoal,
          goalName: tGoalName,
          sdgsId: tSdgsId,
          subjectId: tSubjectId,
          subjectName: tSubjectName,
          unit: tUnit,
          definition: tDefinition,
          notes: tNotes,
          verticalVariableId: tVerticalVariableId,
          graphId: tGraphId,
          graphName: tGraphName,
          metaActivity: tMetaActivity,
          metaVar: tMetaVar,
        );

        // assert
        expect(tModel, equals(model2));
        expect(tModel.hashCode, equals(model2.hashCode));
      });

      test('should not be equal when id is different', () {
        // arrange
        const other = SdgIndicatorModel(
          id: 9999,
          title: tTitle,
          goal: tGoal,
          goalName: tGoalName,
          sdgsId: tSdgsId,
          subjectId: tSubjectId,
          subjectName: tSubjectName,
          unit: tUnit,
          definition: tDefinition,
          notes: tNotes,
          verticalVariableId: tVerticalVariableId,
          graphId: tGraphId,
          graphName: tGraphName,
        );

        // assert
        expect(tModel, isNot(equals(other)));
      });
    });

    group('inheritance', () {
      test('should be a subclass of SdgIndicator', () {
        expect(tModel, isA<SdgIndicator>());
      });

      test('should be a subclass of BaseEntity', () {
        expect(tModel, isA<BaseEntity>());
      });
    });
  });
}
