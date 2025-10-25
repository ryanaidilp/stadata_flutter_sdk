import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/variable_info.dart';

/// Entity representing a dynamic statistical table from BPS Web API.
///
/// For **list** endpoint, contains basic variable metadata.
/// For **detail** endpoint, includes comprehensive data with multiple dimensions.
///
/// API endpoints:
/// - List: `/api/list/model/data/{domain}`
/// - Detail: `/api/list/model/data/{domain}/var/{var}/th/{th}`
class DynamicTable extends BaseEntity {
  /// Creates a [DynamicTable] instance for list responses.
  const DynamicTable({
    required this.variableID,
    required this.title,
    required this.subjectID,
    required this.subjectName,
    required this.notes,
    required this.unit,
    required this.verticalVariableID,
    required this.domain,
    this.csaSubjectID,
    this.csaSubjectName,
    this.graphID,
    this.graphName,
    this.variables = const [],
    this.verticalVariables = const [],
    this.periods = const [],
    this.derivedVariables = const [],
    this.derivedPeriods = const [],
    this.verticalVariableLabel,
    this.dataContent = const {},
  });

  /// Creates a [DynamicTable] for detail responses with full data.
  const DynamicTable.withData({
    required this.variableID,
    required this.title,
    required this.subjectID,
    required this.subjectName,
    required this.notes,
    required this.unit,
    required this.verticalVariableID,
    required this.domain,
    this.csaSubjectID,
    this.csaSubjectName,
    this.graphID,
    this.graphName,
    this.variables = const [],
    this.verticalVariables = const [],
    this.periods = const [],
    this.derivedVariables = const [],
    this.derivedPeriods = const [],
    this.verticalVariableLabel,
    this.dataContent = const {},
  });

  /// Variable ID.
  final int variableID;

  /// Variable title/label.
  final String title;

  /// Subject category ID.
  final int subjectID;

  /// Subject category name.
  final String subjectName;

  /// Methodological notes.
  final String notes;

  /// Unit of measurement.
  final String unit;

  /// Vertical variable ID for dimensional breakdown.
  final int verticalVariableID;

  /// Domain code (regional scope).
  final String domain;

  /// Cross-sectional analysis subject ID.
  final int? csaSubjectID;

  /// Cross-sectional analysis subject name.
  final String? csaSubjectName;

  /// Graph/visualization configuration ID.
  final int? graphID;

  /// Graph/visualization name.
  final String? graphName;

  // Detail response fields (populated only for detail endpoint)

  /// Variable metadata (from 'var' field in detail response).
  final List<VariableInfo> variables;

  /// Vertical variable values (from 'vervar' field).
  final List<VerticalVariableInfo> verticalVariables;

  /// Time periods (from 'tahun' field).
  final List<PeriodInfo> periods;

  /// Derived variables (from 'turvar' field).
  final List<VerticalVariableInfo> derivedVariables;

  /// Derived periods (from 'turtahun' field).
  final List<VerticalVariableInfo> derivedPeriods;

  /// Label for vertical variable dimension (from 'labelvervar' field).
  final String? verticalVariableLabel;

  /// Raw data content as key-value pairs (from 'datacontent' field).
  ///
  /// Keys are composite: "{vervar}{var}{tahun}" (e.g., "7315310990").
  /// Values are the statistical measurements.
  final Map<String, dynamic> dataContent;

  @override
  List<Object?> get props => [
    variableID,
    title,
    subjectID,
    subjectName,
    notes,
    unit,
    verticalVariableID,
    domain,
    csaSubjectID,
    csaSubjectName,
    graphID,
    graphName,
    variables,
    verticalVariables,
    periods,
    derivedVariables,
    derivedPeriods,
    verticalVariableLabel,
    dataContent,
  ];
}
