import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing statistical variables from BPS Web API.
///
/// This class maps to the variables endpoint:
/// `https://webapi.bps.go.id/v1/api/list/variable`
///
/// Statistical variables represent specific measurable phenomena, indicators,
/// or characteristics that are systematically collected, analyzed, and reported
/// by BPS. They form the fundamental building blocks of statistical datasets
/// and provide the conceptual framework for organizing quantitative information.
///
/// Variables serve essential functions in the statistical system:
/// - Define what is being measured in surveys and data collection
/// - Provide conceptual organization for statistical datasets
/// - Enable systematic comparison across time periods and regions
/// - Support construction of composite indicators and indexes
/// - Facilitate international statistical standards compliance
/// - Enable cross-tabulation and multidimensional analysis
///
/// Each variable includes comprehensive metadata about:
/// - Measurement definitions and methodological notes
/// - Associated units of measurement and scales
/// - Subject area and thematic classification
/// - Relationships to other variables and derived measures
/// - Data sources and collection mechanisms
///
/// Examples of statistical variables include:
/// - Jumlah Penduduk (Population Count)
/// - Tingkat Partisipasi Angkatan Kerja (Labor Force Participation Rate)
/// - Produk Domestik Regional Bruto (Regional Gross Domestic Product)
/// - Indeks Harga Konsumen (Consumer Price Index)
/// - Tingkat Kemiskinan (Poverty Rate)
///
/// Documentation: https://webapi.bps.go.id/documentation/#dynamicdata_6
class Variable extends BaseEntity {
  /// Creates a new [Variable] instance.
  const Variable({
    required this.id,
    required this.graphName,
    required this.notes,
    required this.subjectID,
    required this.subjectName,
    required this.title,
    required this.unit,
    required this.verticalVariableID,
    this.csaSubjectName,
    this.csaSubjectID,
    this.type,
    this.derivedPeriodID,
    this.derivedVariableID,
  });

  /// Unique identifier for the statistical variable within BPS system
  final int id;

  /// Shortened name optimized for display in charts and graphs
  ///
  /// Concise version of the variable name designed for visualization
  /// purposes where space is limited, maintaining clarity while being
  /// suitable for chart axes and graph legends.
  final String graphName;

  /// Comprehensive methodological notes and variable definitions
  ///
  /// Detailed documentation explaining the variable's measurement methodology,
  /// data collection procedures, definitions, scope, and any important
  /// caveats or limitations users should be aware of.
  final String notes;

  /// Identifier of the statistical subject area this variable belongs to
  ///
  /// Links the variable to its thematic domain within the BPS subject
  /// classification system for organizational and discovery purposes.
  final int subjectID;

  /// Name of the statistical subject area containing this variable
  ///
  /// Human-readable name of the thematic domain, providing context
  /// about the variable's statistical area and scope.
  final String subjectName;

  /// Official title and full name of the statistical variable
  ///
  /// Complete, formal name of the variable as used in official statistics
  /// and documentation. Examples: "Tingkat Partisipasi Angkatan Kerja",
  /// "Produk Domestik Regional Bruto Atas Dasar Harga Konstan"
  final String title;

  /// Unit of measurement for the variable values
  ///
  /// Specifies the quantitative scale and measurement unit used for
  /// this variable's data values, ensuring proper interpretation.
  final String unit;

  /// Identifier linking to the associated vertical variable structure
  ///
  /// References the vertical variable that provides dimensional breakdown
  /// or categorical structure for cross-tabulation with this variable.
  final int verticalVariableID;

  /// Name of the cross-sectional subject classification
  ///
  /// Optional field indicating the subject classification used for
  /// cross-sectional analysis or comparison with this variable.
  final String? csaSubjectName;

  /// Identifier for the cross-sectional subject classification
  ///
  /// Optional numeric reference to the Central Statistics Agency subject
  /// classification system used for organizing cross-sectional analysis.
  final int? csaSubjectID;

  /// Variable type classification for systematic organization
  ///
  /// Optional numeric code indicating the type or category of statistical
  /// variable for internal classification and processing purposes.
  final int? type;

  /// Identifier for derived time period calculations
  ///
  /// Optional reference to time period definitions used when this variable
  /// involves derived temporal calculations or aggregations.
  final int? derivedPeriodID;

  /// Identifier for source variables used in derived calculations
  ///
  /// Optional reference to base variables that are used to calculate
  /// or derive this variable's values through statistical operations.
  final int? derivedVariableID;

  @override
  List<Object?> get props => [
    id,
    graphName,
    notes,
    subjectID,
    subjectName,
    title,
    unit,
    verticalVariableID,
    csaSubjectName,
    csaSubjectID,
    type,
    derivedPeriodID,
    derivedVariableID,
  ];
}
