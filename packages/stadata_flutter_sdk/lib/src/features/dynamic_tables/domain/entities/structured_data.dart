import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Represents the structured output of [DynamicTable.toStructuredData()].
///
/// This provides a universal format suitable for tables, charts,
/// exports (CSV, Excel), and other consumers.
class const DynamicTableStructuredData({
  /// Subject category ID.
  required final int subjectId,

  /// Subject category label.
  required final String subjectLabel,

  /// Variable ID.
  required final int variableId,

  /// Variable label.
  required final String variableLabel,

  /// Variable unit of measurement.
  required final String variableUnit,

  /// Label for vertical variable dimension.
  required final String verticalVariableLabel,

  /// Nested hierarchical data.
  required final List<StructuredDataLevel1> data,

  /// Last update timestamp.
  final String? lastUpdate,
}) extends BaseEntity {
  @override
  List<Object?> get props => [
    subjectId,
    subjectLabel,
    variableId,
    variableLabel,
    variableUnit,
    verticalVariableLabel,
    lastUpdate,
    data,
  ];
}

/// Level 1 of structured data hierarchy (Vertical Variables).
class const StructuredDataLevel1({
  /// Identifier for this level.
  required final dynamic id,

  /// Display label.
  required final String label,

  /// Nested data (Level 2).
  required final List<StructuredDataLevel2> data,
}) extends BaseEntity {
  @override
  List<Object?> get props => [id, label, data];
}

/// Level 2 of structured data hierarchy (Derived Variables or Periods).
class const StructuredDataLevel2({
  /// Identifier for this level.
  required final dynamic id,

  /// Display label.
  required final String label,

  /// Nested data (Level 3).
  required final List<StructuredDataLevel3> data,
}) extends BaseEntity {
  @override
  List<Object?> get props => [id, label, data];
}

/// Level 3 of structured data hierarchy (Periods or Derived Periods).
///
/// This level can either contain a direct [value] or nested [data] (Level 4).
class const StructuredDataLevel3({
  /// Identifier for this level.
  required final dynamic id,

  /// Display label.
  required final String label,

  /// Direct value (when no Level 4 exists).
  final dynamic value,

  /// Nested data (Level 4, when derived periods exist).
  final List<StructuredDataLevel4>? data,
}) extends BaseEntity {
  @override
  List<Object?> get props => [id, label, value, data];
}

/// Level 4 of structured data hierarchy (Derived Periods).
///
/// This is the deepest level and always contains a direct [value].
class const StructuredDataLevel4({
  /// Identifier for this level.
  required final dynamic id,

  /// Display label.
  required final String label,

  /// The data value.
  required final dynamic value,
}) extends BaseEntity {
  @override
  List<Object?> get props => [id, label, value];
}
