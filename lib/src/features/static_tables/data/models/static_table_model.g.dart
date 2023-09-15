// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'static_table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StaticTableModel _$$_StaticTableModelFromJson(Map<String, dynamic> json) =>
    _$_StaticTableModel(
      id: json['table_id'] as int,
      title: json['title'] as String,
      subjectId: _subjectIdValueReader(json, 'subj_id') as int,
      size: json['size'] as String,
      updatedAt: DateTime.parse(json['updt_date'] as String),
      excel: json['excel'] as String,
      subject: json['subj'] as String?,
      table: json['table'] as String?,
      createdAt: json['cr_date'] == null
          ? null
          : DateTime.parse(json['cr_date'] as String),
    );

Map<String, dynamic> _$$_StaticTableModelToJson(_$_StaticTableModel instance) =>
    <String, dynamic>{
      'table_id': instance.id,
      'title': instance.title,
      'subj_id': instance.subjectId,
      'size': instance.size,
      'updt_date': instance.updatedAt.toIso8601String(),
      'excel': instance.excel,
      'subj': instance.subject,
      'table': instance.table,
      'cr_date': instance.createdAt?.toIso8601String(),
    };
