import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/tables/domain/entities/table_metadata.dart';
import 'package:stadata_flutter_sdk/src/features/tables/domain/enums/table_type.dart';

// JSON keys for API response mapping
const _idKey = 'table_id';
const _titleKey = 'title';
const _tableSourceKey = 'table_source';
const _subjectIdKey = 'sub_id';
const _subjectNameKey = 'subject';
const _domainKey = 'domain';
const _updatedAtKey = 'updt_date';

// Alternative keys for different API endpoints
const _fallbackIdKey = 'tabel_id';
const _fallbackSubjectIdKey = 'subj_id';
const _fallbackTableSourceKey = 'tablesource';

/// Data model for [TableMetadata] with JSON serialization support.
///
/// This model handles the conversion between JSON responses from various
/// BPS API endpoints and the domain [TableMetadata] entity. It supports
/// multiple API response formats since table metadata can come from
/// different endpoints with varying structures.
class TableMetadataModel extends TableMetadata {
  /// Creates a [TableMetadataModel] instance.
  const TableMetadataModel({
    required super.id,
    required super.title,
    required super.type,
    super.subjectID,
    super.subjectName,
    super.domain,
    super.tableSource,
    super.updatedAt,
  });

  /// Creates a [TableMetadataModel] from JSON data.
  ///
  /// Handles multiple JSON key variations from different API endpoints:
  /// - table_id / tabel_id → id
  /// - table_source / tablesource → tableSource
  /// - sub_id / subj_id → subjectID
  factory TableMetadataModel.fromJson(JSON json) {
    // Extract ID with fallback
    final id = (json[_idKey] ?? json[_fallbackIdKey] ?? '') as String;

    // Extract title
    final title = json[_titleKey] as String? ?? '';

    // Extract and parse table source/type
    final tableSourceValue =
        (json[_tableSourceKey] ?? json[_fallbackTableSourceKey]) as String?;
    final type = TableType.fromString(tableSourceValue);

    // Extract subject ID with fallback
    final subjectID =
        (json[_subjectIdKey] ?? json[_fallbackSubjectIdKey]) as int?;

    // Extract subject name
    final subjectName = json[_subjectNameKey] as String?;

    // Extract domain
    final domain = json[_domainKey] as String?;

    // Parse update date
    DateTime? updatedAt;
    final updatedAtStr = json[_updatedAtKey] as String?;
    if (updatedAtStr != null && updatedAtStr.isNotEmpty) {
      try {
        updatedAt = DateTime.parse(updatedAtStr);
      } on FormatException {
        // If parsing fails, leave as null
        updatedAt = null;
      }
    }

    return TableMetadataModel(
      id: id,
      title: title,
      type: type,
      subjectID: subjectID,
      subjectName: subjectName,
      domain: domain,
      tableSource: tableSourceValue,
      updatedAt: updatedAt,
    );
  }

  /// Converts this model to JSON format.
  ///
  /// Generates a JSON object suitable for API requests or serialization.
  JSON toJson() => {
    _idKey: id,
    _titleKey: title,
    _tableSourceKey: type.toApiValue(),
    if (subjectID != null) _subjectIdKey: subjectID,
    if (subjectName != null) _subjectNameKey: subjectName,
    if (domain != null) _domainKey: domain,
    if (updatedAt != null) _updatedAtKey: updatedAt!.toIso8601String(),
  };

  /// Creates a copy of this model with the given fields replaced.
  ///
  /// Uses [ValueGetter] for nullable fields to distinguish between
  /// "not provided" (use existing) and "set to null" (clear value).
  TableMetadataModel copyWith({
    String? id,
    String? title,
    TableType? type,
    ValueGetter<int?>? subjectID,
    ValueGetter<String?>? subjectName,
    ValueGetter<String?>? domain,
    ValueGetter<String?>? tableSource,
    ValueGetter<DateTime?>? updatedAt,
  }) => TableMetadataModel(
    id: id ?? this.id,
    title: title ?? this.title,
    type: type ?? this.type,
    subjectID: subjectID != null ? subjectID() : this.subjectID,
    subjectName: subjectName != null ? subjectName() : this.subjectName,
    domain: domain != null ? domain() : this.domain,
    tableSource: tableSource != null ? tableSource() : this.tableSource,
    updatedAt: updatedAt != null ? updatedAt() : this.updatedAt,
  );

  /// Creates a [TableMetadataModel] from a [TableMetadata] entity.
  ///
  /// Used for testing or when constructing models from domain entities.
  factory TableMetadataModel.fromEntity(TableMetadata entity) {
    return TableMetadataModel(
      id: entity.id,
      title: entity.title,
      type: entity.type,
      subjectID: entity.subjectID,
      subjectName: entity.subjectName,
      domain: entity.domain,
      tableSource: entity.tableSource,
      updatedAt: entity.updatedAt,
    );
  }
}
