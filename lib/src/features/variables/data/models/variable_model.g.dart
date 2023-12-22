// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VariableModelImpl _$$VariableModelImplFromJson(Map<String, dynamic> json) =>
    _$VariableModelImpl(
      id: json['var_id'] as int,
      graphName: json['graph_name'] as String? ?? '',
      notes: json['notes'] as String,
      subjectID: json['sub_id'] as int,
      subjectName: json['sub_name'] as String,
      title: json['title'] as String,
      unit: json['unit'] as String,
      verticalVariableID: json['vertical'] as int,
      csaSubjectID: json['subcsa_id'] as int?,
      csaSubjectName: json['subcsa_name'] as String?,
      type: json['type'] as int?,
      derivedPeriodID: json['turth'] as int?,
      derivedVariableID: json['turvar'] as int?,
    );

Map<String, dynamic> _$$VariableModelImplToJson(_$VariableModelImpl instance) =>
    <String, dynamic>{
      'var_id': instance.id,
      'graph_name': instance.graphName,
      'notes': instance.notes,
      'sub_id': instance.subjectID,
      'sub_name': instance.subjectName,
      'title': instance.title,
      'unit': instance.unit,
      'vertical': instance.verticalVariableID,
      'subcsa_id': instance.csaSubjectID,
      'subcsa_name': instance.csaSubjectName,
      'type': instance.type,
      'turth': instance.derivedPeriodID,
      'turvar': instance.derivedVariableID,
    };
