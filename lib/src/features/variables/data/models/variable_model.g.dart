// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VariableModelImpl _$$VariableModelImplFromJson(Map<String, dynamic> json) =>
    _$VariableModelImpl(
      id: (json['var_id'] as num).toInt(),
      notes: const NoteSerializer().fromJson(json['notes'] as String),
      subjectID: (json['sub_id'] as num).toInt(),
      subjectName: json['sub_name'] as String,
      title: json['title'] as String,
      verticalVariableID: (json['vertical'] as num).toInt(),
      graphName: json['graph_name'] as String? ?? '',
      unit: json['unit'] as String? ?? '',
      csaSubjectID: (json['subcsa_id'] as num?)?.toInt(),
      csaSubjectName: json['subcsa_name'] as String?,
      type: (json['type'] as num?)?.toInt(),
      derivedPeriodID: (json['turth'] as num?)?.toInt(),
      derivedVariableID: (json['turvar'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VariableModelImplToJson(_$VariableModelImpl instance) =>
    <String, dynamic>{
      'var_id': instance.id,
      'notes': const NoteSerializer().toJson(instance.notes),
      'sub_id': instance.subjectID,
      'sub_name': instance.subjectName,
      'title': instance.title,
      'vertical': instance.verticalVariableID,
      'graph_name': instance.graphName,
      'unit': instance.unit,
      'subcsa_id': instance.csaSubjectID,
      'subcsa_name': instance.csaSubjectName,
      'type': instance.type,
      'turth': instance.derivedPeriodID,
      'turvar': instance.derivedVariableID,
    };
