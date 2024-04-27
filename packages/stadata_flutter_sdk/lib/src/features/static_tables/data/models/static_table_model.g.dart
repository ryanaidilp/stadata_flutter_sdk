// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'static_table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaticTableModelImpl _$$StaticTableModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StaticTableModelImpl(
      id: (json['table_id'] as num).toInt(),
      title: json['title'] as String,
      subjectID: (_subjectIdValueReader(json, 'subj_id') as num).toInt(),
      size: json['size'] as String,
      updatedAt: DateTime.parse(json['updt_date'] as String),
      excel: json['excel'] as String,
      subject: json['subj'] as String?,
      table: _$JsonConverterFromJson<String, String>(
          json['table'], const TableSerializer().fromJson),
      createdAt: json['cr_date'] == null
          ? null
          : DateTime.parse(json['cr_date'] as String),
    );

Map<String, dynamic> _$$StaticTableModelImplToJson(
        _$StaticTableModelImpl instance) =>
    <String, dynamic>{
      'table_id': instance.id,
      'title': instance.title,
      'subj_id': instance.subjectID,
      'size': instance.size,
      'updt_date': instance.updatedAt.toIso8601String(),
      'excel': instance.excel,
      'subj': instance.subject,
      'table': _$JsonConverterToJson<String, String>(
          instance.table, const TableSerializer().toJson),
      'cr_date': instance.createdAt?.toIso8601String(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
