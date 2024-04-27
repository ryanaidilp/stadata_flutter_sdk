// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strategic_indicator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StrategicIndicatorModelImpl _$$StrategicIndicatorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StrategicIndicatorModelImpl(
      id: (json['indicator_id'] as num).toInt(),
      variableID: (json['var'] as num).toInt(),
      categoryID: (json['category'] as num).toInt(),
      name: json['name'] as String,
      title: json['title'] as String,
      dataSource: json['data_source'] as String,
      value: (json['value'] as num).toDouble(),
      hashID: json['hash_id'] as String,
      period: json['periode'] as String,
      unit: json['unit'] as String? ?? '-',
      csaSubjectID: (json['subject_csa'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StrategicIndicatorModelImplToJson(
        _$StrategicIndicatorModelImpl instance) =>
    <String, dynamic>{
      'indicator_id': instance.id,
      'var': instance.variableID,
      'category': instance.categoryID,
      'name': instance.name,
      'title': instance.title,
      'data_source': instance.dataSource,
      'value': instance.value,
      'hash_id': instance.hashID,
      'periode': instance.period,
      'unit': instance.unit,
      'subject_csa': instance.csaSubjectID,
    };
