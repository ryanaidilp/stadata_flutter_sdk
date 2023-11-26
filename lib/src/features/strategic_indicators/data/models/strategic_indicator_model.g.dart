// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strategic_indicator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StrategicIndicatorModelImpl _$$StrategicIndicatorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StrategicIndicatorModelImpl(
      id: json['indicator_id'] as int,
      variableID: json['var'] as int,
      csaSubjectID: json['subject_csa'] as int,
      categoryID: json['category'] as int,
      name: json['name'] as String,
      title: json['title'] as String,
      dataSource: json['dataSource'] as String,
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
      hashID: json['hash_id'] as String,
      period: json['period'] as String,
    );

Map<String, dynamic> _$$StrategicIndicatorModelImplToJson(
        _$StrategicIndicatorModelImpl instance) =>
    <String, dynamic>{
      'indicator_id': instance.id,
      'var': instance.variableID,
      'subject_csa': instance.csaSubjectID,
      'category': instance.categoryID,
      'name': instance.name,
      'title': instance.title,
      'dataSource': instance.dataSource,
      'value': instance.value,
      'unit': instance.unit,
      'hash_id': instance.hashID,
      'period': instance.period,
    };
