import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing a dynamic statistical table from BPS Web API.
///
/// This class maps to the dynamic table endpoints:
/// - List: `https://webapi.bps.go.id/v1/api/list/model/dynamictable/{lang}/{domain}`
/// - View: `https://webapi.bps.go.id/v1/api/view/model/dynamictable/{lang}/{var}/{domain}/{th}`
///
/// Dynamic tables provide flexible, multi-dimensional statistical data that can
/// be queried and filtered by various parameters including variables, time periods,
/// and vertical classifications. Unlike static tables, dynamic tables allow users
/// to construct custom views of the data by selecting specific dimensions.
///
/// Key features of dynamic tables:
/// - Multi-dimensional data structure with variables and classifications
/// - Time series data across different periods
/// - Cross-tabulation capabilities with vertical variables
/// - Support for derived variables and calculated indicators
/// - Flexible filtering and aggregation options
///
/// Dynamic tables serve essential functions:
/// - Enable custom data queries and analysis
/// - Support complex statistical aggregations
/// - Provide time series analysis capabilities
/// - Allow cross-sectional comparisons
/// - Facilitate data export and integration
///
/// Examples of dynamic table use cases:
/// - Population statistics by age group and region over time
/// - Economic indicators with multiple breakdown dimensions
/// - Labor force data by sector and education level
/// - Regional GDP with industry classification
///
/// Documentation: https://webapi.bps.go.id/documentation/#dynamicdata
class DynamicTable extends BaseEntity {
  /// Creates a new [DynamicTable] instance.
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
    this.data = const [],
  });

  /// Unique identifier for the statistical variable.
  ///
  /// References the variable definition that this dynamic table
  /// provides data for. Used to construct view API requests.
  final int variableID;

  /// Official title and full name of the statistical variable.
  ///
  /// Complete, formal name of the variable as used in official statistics.
  /// Examples: "Jumlah Penduduk", "Produk Domestik Regional Bruto"
  final String title;

  /// Identifier of the statistical subject area.
  ///
  /// Links the table to its thematic domain within the BPS subject
  /// classification system for organizational purposes.
  final int subjectID;

  /// Name of the statistical subject area.
  ///
  /// Human-readable name of the thematic domain providing context
  /// about the table's statistical area.
  final String subjectName;

  /// Comprehensive methodological notes and definitions.
  ///
  /// Detailed documentation explaining measurement methodology,
  /// data collection procedures, definitions, and caveats.
  final String notes;

  /// Unit of measurement for the table values.
  ///
  /// Specifies the quantitative scale and measurement unit,
  /// e.g., "Jiwa" (persons), "Juta Rupiah" (million rupiahs).
  final String unit;

  /// Identifier linking to the vertical variable structure.
  ///
  /// References the vertical variable providing dimensional breakdown
  /// or categorical structure for cross-tabulation.
  final int verticalVariableID;

  /// Domain identifier for regional scope.
  ///
  /// Identifies the regional level and area this table covers,
  /// e.g., national (7200), provincial, or regency level.
  final String domain;

  /// Identifier for cross-sectional subject classification.
  ///
  /// Optional numeric reference to CSA subject classification
  /// used for organizing cross-sectional analysis.
  final int? csaSubjectID;

  /// Name of the cross-sectional subject classification.
  ///
  /// Optional field indicating the subject classification used
  /// for cross-sectional comparison.
  final String? csaSubjectName;

  /// Identifier for graph/visualization configuration.
  ///
  /// Optional reference to predefined graph settings for
  /// visualizing this table's data.
  final int? graphID;

  /// Name of the graph/visualization type.
  ///
  /// Shortened name optimized for display in charts and graphs.
  final String? graphName;

  /// The actual table data organized by time periods.
  ///
  /// Contains the statistical values organized in a multi-dimensional
  /// structure. Each entry typically represents data for a specific
  /// time period with breakdown by vertical variable categories.
  final List<DynamicTableData> data;

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
        data,
      ];
}

/// Represents a single data entry in a dynamic table.
///
/// Contains the actual statistical values with their associated
/// time period and vertical variable breakdown.
class DynamicTableData extends BaseEntity {
  /// Creates a new [DynamicTableData] instance.
  const DynamicTableData({
    required this.period,
    required this.values,
  });

  /// Time period identifier for this data entry.
  ///
  /// References the period (year, quarter, month, etc.) this
  /// data represents. Format depends on the table's periodicity.
  final String period;

  /// Statistical values broken down by vertical variable categories.
  ///
  /// Map where keys are vertical variable category identifiers
  /// and values are the corresponding statistical measurements.
  /// Allows for multi-dimensional data representation.
  final Map<String, dynamic> values;

  @override
  List<Object?> get props => [period, values];
}
