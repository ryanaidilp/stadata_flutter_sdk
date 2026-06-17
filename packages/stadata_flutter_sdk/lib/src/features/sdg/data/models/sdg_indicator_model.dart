import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _varIdKey = 'var_id';
const _titleKey = 'title';
const _sdgsGoalKey = 'sdgs_goal';
const _sdgsGoalNameKey = 'sdgs_goal_name';
const _sdgsIdKey = 'sdgs_id';
const _subIdKey = 'sub_id';
const _subNameKey = 'sub_name';
const _unitKey = 'unit';
const _defKey = 'def';
const _notesKey = 'notes';
const _verticalKey = 'vertical';
const _graphIdKey = 'graph_id';
const _graphNameKey = 'graph_name';
const _metaActivityKey = 'meta_activity';
const _metaVarKey = 'meta_var';

class SdgIndicatorModel extends SdgIndicator {
  const SdgIndicatorModel({
    required super.id,
    required super.title,
    required super.goal,
    required super.goalName,
    required super.sdgsId,
    required super.subjectId,
    required super.subjectName,
    required super.unit,
    required super.definition,
    required super.notes,
    required super.verticalVariableId,
    required super.graphId,
    required super.graphName,
    super.metaActivity,
    super.metaVar,
  });

  SdgIndicatorModel copyWith({
    int? id,
    String? title,
    String? goal,
    String? goalName,
    String? sdgsId,
    int? subjectId,
    String? subjectName,
    String? unit,
    String? definition,
    String? notes,
    int? verticalVariableId,
    int? graphId,
    String? graphName,
    String? metaActivity,
    String? metaVar,
  }) => SdgIndicatorModel(
    id: id ?? this.id,
    title: title ?? this.title,
    goal: goal ?? this.goal,
    goalName: goalName ?? this.goalName,
    sdgsId: sdgsId ?? this.sdgsId,
    subjectId: subjectId ?? this.subjectId,
    subjectName: subjectName ?? this.subjectName,
    unit: unit ?? this.unit,
    definition: definition ?? this.definition,
    notes: notes ?? this.notes,
    verticalVariableId: verticalVariableId ?? this.verticalVariableId,
    graphId: graphId ?? this.graphId,
    graphName: graphName ?? this.graphName,
    metaActivity: metaActivity ?? this.metaActivity,
    metaVar: metaVar ?? this.metaVar,
  );

  factory SdgIndicatorModel.fromJson(JSON json) => SdgIndicatorModel(
    id: json[_varIdKey] as int,
    title: json[_titleKey] as String,
    goal: json[_sdgsGoalKey] as String,
    goalName: json[_sdgsGoalNameKey] as String,
    sdgsId: json[_sdgsIdKey] as String,
    subjectId: json[_subIdKey] as int,
    subjectName: json[_subNameKey] as String,
    unit: json[_unitKey] as String,
    definition: json[_defKey] as String? ?? '',
    notes: json[_notesKey] as String? ?? '',
    verticalVariableId: json[_verticalKey] as int,
    graphId: json[_graphIdKey] as int,
    graphName: json[_graphNameKey] as String,
    metaActivity: json[_metaActivityKey] as String?,
    metaVar: json[_metaVarKey] as String?,
  );

  JSON toJson() => {
    _varIdKey: id,
    _titleKey: title,
    _sdgsGoalKey: goal,
    _sdgsGoalNameKey: goalName,
    _sdgsIdKey: sdgsId,
    _subIdKey: subjectId,
    _subNameKey: subjectName,
    _unitKey: unit,
    _defKey: definition,
    _notesKey: notes,
    _verticalKey: verticalVariableId,
    _graphIdKey: graphId,
    _graphNameKey: graphName,
    _metaActivityKey: metaActivity,
    _metaVarKey: metaVar,
  };
}
