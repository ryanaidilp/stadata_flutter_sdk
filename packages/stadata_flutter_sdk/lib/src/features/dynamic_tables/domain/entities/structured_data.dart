import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Represents the structured output of [DynamicTable.toStructuredData()].
///
/// This provides a universal format suitable for tables, charts,
/// exports (CSV, Excel), and other consumers.
class DynamicTableStructuredData extends BaseEntity {
  /// Creates a new [DynamicTableStructuredData] instance.
  const DynamicTableStructuredData({
    required this.subjectId,
    required this.subjectLabel,
    required this.variableId,
    required this.variableLabel,
    required this.variableUnit,
    required this.verticalVariableLabel,
    required this.data,
    this.lastUpdate,
  });

  /// Subject category ID.
  final int subjectId;

  /// Subject category label.
  final String subjectLabel;

  /// Variable ID.
  final int variableId;

  /// Variable label.
  final String variableLabel;

  /// Variable unit of measurement.
  final String variableUnit;

  /// Label for vertical variable dimension.
  final String verticalVariableLabel;

  /// Last update timestamp.
  final String? lastUpdate;

  /// Nested hierarchical data.
  final List<StructuredDataLevel1> data;

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
class StructuredDataLevel1 extends BaseEntity {
  /// Creates a new [StructuredDataLevel1] instance.
  const StructuredDataLevel1({
    required this.id,
    required this.label,
    required this.data,
  });

  /// Identifier for this level.
  final dynamic id;

  /// Display label.
  final String label;

  /// Nested data (Level 2).
  final List<StructuredDataLevel2> data;

  @override
  List<Object?> get props => [id, label, data];
}

/// Level 2 of structured data hierarchy (Derived Variables or Periods).
class StructuredDataLevel2 extends BaseEntity {
  /// Creates a new [StructuredDataLevel2] instance.
  const StructuredDataLevel2({
    required this.id,
    required this.label,
    required this.data,
  });

  /// Identifier for this level.
  final dynamic id;

  /// Display label.
  final String label;

  /// Nested data (Level 3).
  final List<StructuredDataLevel3> data;

  @override
  List<Object?> get props => [id, label, data];
}

/// Level 3 of structured data hierarchy (Periods or Derived Periods).
///
/// This level can either contain a direct [value] or nested [data] (Level 4).
class StructuredDataLevel3 extends BaseEntity {
  /// Creates a new [StructuredDataLevel3] instance.
  const StructuredDataLevel3({
    required this.id,
    required this.label,
    this.value,
    this.data,
  });

  /// Identifier for this level.
  final dynamic id;

  /// Display label.
  final String label;

  /// Direct value (when no Level 4 exists).
  final dynamic value;

  /// Nested data (Level 4, when derived periods exist).
  final List<StructuredDataLevel4>? data;

  @override
  List<Object?> get props => [id, label, value, data];
}

/// Level 4 of structured data hierarchy (Derived Periods).
///
/// This is the deepest level and always contains a direct [value].
class StructuredDataLevel4 extends BaseEntity {
  /// Creates a new [StructuredDataLevel4] instance.
  const StructuredDataLevel4({
    required this.id,
    required this.label,
    required this.value,
  });

  /// Identifier for this level.
  final dynamic id;

  /// Display label.
  final String label;

  /// The data value.
  final dynamic value;

  @override
  List<Object?> get props => [id, label, value];
}
