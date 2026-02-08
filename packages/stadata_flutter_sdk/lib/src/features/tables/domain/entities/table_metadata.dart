import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/tables/domain/enums/table_type.dart';

/// Unified metadata entity for all table types in BPS WebAPI.
///
/// This entity provides a common interface for accessing table information
/// regardless of the underlying table type (static, dynamic, or simdasi).
/// It enables the unified table navigation pattern where table type is
/// determined at runtime based on API metadata.
///
/// The metadata includes basic identification and classification information
/// that allows the application to route to the appropriate table display
/// implementation without requiring separate entry points for each type.
class TableMetadata extends BaseEntity {
  /// Creates a [TableMetadata] instance.
  const TableMetadata({
    required this.id,
    required this.title,
    required this.type,
    this.subjectID,
    this.subjectName,
    this.domain,
    this.tableSource,
    this.updatedAt,
  });

  /// Unique identifier for the table.
  ///
  /// This ID is used to fetch detailed table data from the appropriate
  /// API endpoint based on the [type].
  final String id;

  /// Human-readable title of the table.
  ///
  /// Provides a descriptive name suitable for display in lists and
  /// detail views. Should be localized if available.
  final String title;

  /// The type of this table.
  ///
  /// Determines which display implementation and API endpoints to use.
  /// Critical for the unified navigation pattern.
  final TableType type;

  /// Subject category identifier.
  ///
  /// Links this table to broader statistical subject categories for
  /// thematic organization and filtering.
  final int? subjectID;

  /// Human-readable subject category name.
  ///
  /// Provides context about the statistical domain this table covers.
  final String? subjectName;

  /// Domain code for regional/administrative scope.
  ///
  /// Examples: "0000" for national, "3200" for West Java province.
  final String? domain;

  /// Internal table source identifier.
  ///
  /// Used by some API endpoints to distinguish table origins:
  /// - "1" typically indicates static tables
  /// - "2" typically indicates dynamic tables
  /// - "3" typically indicates simdasi tables
  final String? tableSource;

  /// Timestamp of last data update.
  ///
  /// Helps users assess data currency and update schedules.
  final DateTime? updatedAt;

  /// Returns true if this is a dynamic table requiring parameter selection.
  bool get isDynamic => type == TableType.dynamic;

  /// Returns true if this is a static table with pre-rendered content.
  bool get isStatic => type == TableType.static;

  /// Returns true if this is a simdasi table.
  bool get isSimdasi => type == TableType.simdasi;

  @override
  List<Object?> get props => [
    id,
    title,
    type,
    subjectID,
    subjectName,
    domain,
    tableSource,
    updatedAt,
  ];
}
