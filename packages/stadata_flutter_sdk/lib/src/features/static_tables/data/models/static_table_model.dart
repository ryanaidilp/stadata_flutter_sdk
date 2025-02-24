import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'table_id';
const _titleKey = 'title';
const _subjectIdKey = 'subj_id';
const _sizeKey = 'size';
const _updatedAtKey = 'updt_date';
const _excelKey = 'excel';
const _subjectKey = 'subj';
const _tableKey = 'table';
const _createdAtKey = 'cr_date';
const _fallbackSubjectIdKey = 'sub_id';

class StaticTableModel extends StaticTable {
  const StaticTableModel({
    required super.id,
    required super.title,
    required super.subjectID,
    required super.size,
    required super.updatedAt,
    required super.excel,
    super.subject,
    super.table,
    super.createdAt,
  });

  factory StaticTableModel.fromJson(JSON json) => StaticTableModel(
    id: json[_idKey] as int,
    title: json[_titleKey] as String,
    subjectID: _subjectIdValueReader(json, _subjectIdKey)! as int,
    size: json[_sizeKey] as String,
    updatedAt: DateTime.parse(json[_updatedAtKey] as String),
    excel: json[_excelKey] as String,
    subject: json[_subjectKey] as String?,
    table:
        json[_tableKey] != null
            ? const TableConverter().fromJson(json[_tableKey] as String)
            : null,
    createdAt:
        json[_createdAtKey] != null
            ? DateTime.parse(json[_createdAtKey] as String)
            : null,
  );

  JSON toJson() => {
    _idKey: id,
    _titleKey: title,
    _subjectIdKey: subjectID,
    _sizeKey: size,
    _updatedAtKey: updatedAt.toIso8601String(),
    _excelKey: excel,
    _subjectKey: subject,
    _tableKey: table != null ? const TableConverter().toJson(table!) : null,
    _createdAtKey: createdAt?.toIso8601String(),
  };

  StaticTableModel copyWith({
    int? id,
    String? title,
    int? subjectID,
    String? size,
    DateTime? updatedAt,
    String? excel,
    ValueGetter<String?>? subject,
    ValueGetter<String?>? table,
    ValueGetter<DateTime?>? createdAt,
  }) => StaticTableModel(
    id: id ?? this.id,
    title: title ?? this.title,
    subjectID: subjectID ?? this.subjectID,
    size: size ?? this.size,
    updatedAt: updatedAt ?? this.updatedAt,
    excel: excel ?? this.excel,
    subject: subject != null ? subject() : this.subject,
    table: table != null ? table() : this.table,
    createdAt: createdAt != null ? createdAt() : this.createdAt,
  );
}

Object? _subjectIdValueReader(JSON json, String key) =>
    json[key] ?? json[_fallbackSubjectIdKey];
