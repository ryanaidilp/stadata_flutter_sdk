import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing strategic indicators from BPS Web API.
///
/// This class maps to the strategic indicators endpoint:
/// `https://webapi.bps.go.id/v1/api/list/strategic-indicator`
///
/// Strategic indicators are key statistical measures that track progress
/// toward national development goals and policy objectives. These indicators
/// provide high-level insights into economic performance, social welfare,
/// and development outcomes across Indonesia.
///
/// Strategic indicators serve multiple purposes:
/// - Monitor progress toward national development targets
/// - Support evidence-based policy formulation and evaluation
/// - Enable international comparisons and benchmarking
/// - Track Sustainable Development Goals (SDGs) implementation
/// - Provide summary measures for public reporting and accountability
///
/// Common strategic indicator categories include:
/// - Economic growth and stability (GDP, inflation, employment)
/// - Social development (education, health, poverty reduction)
/// - Infrastructure and connectivity (transportation, communications)
/// - Environmental sustainability (emissions, resource use)
/// - Governance and institutional quality (transparency, rule of law)
///
/// Each indicator includes standardized metadata about data sources,
/// measurement units, time periods, and categorical organization to
/// support reliable monitoring and analysis.
///
/// Documentation: https://webapi.bps.go.id/documentation/#strategic-indicator
class StrategicIndicator extends BaseEntity {
  /// Creates a new [StrategicIndicator] instance.
  const StrategicIndicator({
    required this.id,
    required this.title,
    required this.name,
    required this.dataSource,
    required this.value,
    required this.unit,
    required this.period,
    required this.hashID,
    required this.categoryID,
    required this.variableID,
    this.csaSubjectID,
  });

  /// Unique identifier for the strategic indicator within BPS system
  final int id;

  /// Formal title of the strategic indicator
  ///
  /// Official name used in policy documents and reports.
  /// Examples: "Produk Domestik Bruto", "Tingkat Pengangguran Terbuka",
  /// "Indeks Pembangunan Manusia"
  final String title;

  /// Descriptive name providing additional context for the indicator
  ///
  /// More detailed or alternative naming that helps clarify the indicator's
  /// scope and meaning for different audiences and use cases.
  final String name;

  /// Source of the data used to calculate this strategic indicator
  ///
  /// Identifies the survey, administrative system, or data collection
  /// mechanism that provides the underlying data for this indicator.
  /// Examples: "Sakernas", "Susenas", "Administrative Records"
  final String dataSource;

  /// Current numerical value of the strategic indicator
  ///
  /// The most recent measured value for this indicator, representing
  /// the current state or level of the phenomenon being tracked.
  final double value;

  /// Unit of measurement for the indicator value
  ///
  /// Specifies how the value should be interpreted and displayed.
  /// Examples: "Persen" (Percent), "Triliun Rupiah" (Trillion Rupiah),
  /// "Index" (Index), "Orang" (Persons)
  final String unit;

  /// Time period when this indicator value was measured or calculated
  ///
  /// Specifies the temporal reference for the indicator value.
  /// Examples: "2024", "Triwulan II 2024", "Semester I 2024"
  final String period;

  /// Unique hash identifier for data integrity and version control
  ///
  /// Technical identifier used for tracking data versions, ensuring
  /// data integrity, and linking related indicator records.
  final String hashID;

  /// Identifier for the thematic category this indicator belongs to
  ///
  /// Links the indicator to broader policy domains or development areas
  /// for systematic organization and reporting purposes.
  final int categoryID;

  /// Identifier for the specific variable or measure being tracked
  ///
  /// Technical reference to the underlying statistical variable
  /// definition used in calculating this strategic indicator.
  final int variableID;

  /// Central Statistics Agency subject classification identifier
  ///
  /// Optional link to the official subject classification system
  /// used by BPS for organizing statistical topics and indicators.
  final int? csaSubjectID;

  @override
  List<Object?> get props => [
    id,
    title,
    name,
    dataSource,
    value,
    unit,
    period,
    hashID,
    categoryID,
    variableID,
    csaSubjectID,
  ];
}
