import 'package:stadata_flutter_sdk/src/core/base/base_entity.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Entity class representing statistical classifications from BPS Web API.
///
/// This class maps to the statistical classifications endpoint:
/// `https://webapi.bps.go.id/v1/api/list/statistic-classification`
///
/// Statistical classifications are standardized coding systems and taxonomies
/// used by BPS to organize and categorize economic, social, and demographic
/// data in a consistent and internationally comparable manner.
///
/// Common statistical classifications include:
/// - KBLI (Klasifikasi Baku Lapangan Usaha Indonesia) - Indonesian business activities
/// - KBJI (Klasifikasi Baku Jabatan Indonesia) - Indonesian occupational classifications
/// - ISIC (International Standard Industrial Classification) - Industrial activities
/// - ISCO (International Standard Classification of Occupations) - Occupational standards
/// - HS (Harmonized System) - Trade commodity classifications
/// - COICOP (Classification of Individual Consumption) - Consumption expenditure
///
/// These classifications ensure data consistency, enable international
/// comparisons, support policy analysis, and provide standardized frameworks
/// for statistical data collection and reporting across all BPS activities.
///
/// Documentation: https://webapi.bps.go.id/documentation/#sc
class StatisticClassification extends BaseEntity {
  /// Unique standardized identifier for the statistical classification
  final String id;

  /// Type category of the classification system
  ///
  /// Indicates the nature of the classification such as economic activities,
  /// occupations, commodities, or other standardized categorization types.
  final ClassificationType? type;

  /// Hierarchical level within the classification structure
  ///
  /// Represents the depth or granularity level (e.g., section, division,
  /// group, class) within multi-level classification hierarchies.
  final ClassificationLevel? level;

  /// Official source or originating organization of the classification
  ///
  /// Identifies whether the classification originates from BPS, international
  /// organizations (UN, ILO), or other authoritative statistical bodies.
  final String source;

  /// Official title of the statistical classification
  ///
  /// Examples: "Klasifikasi Baku Lapangan Usaha Indonesia (KBLI) 2020",
  /// "International Standard Industrial Classification (ISIC) Rev. 4"
  final String title;

  /// Detailed description of the classification's scope and methodology
  ///
  /// Comprehensive explanation of the classification's purpose, coverage,
  /// definitions, and application guidelines for proper usage.
  final String description;

  /// International Standard Book Number for published classification manuals
  ///
  /// ISBN identifier when the classification is published as a formal
  /// reference manual or guidebook for statistical practitioners.
  final String? isbn;

  /// International Standard Serial Number for classification series
  ///
  /// ISSN identifier for classification systems that are updated periodically
  /// as part of a continuing publication series.
  final String? issn;

  /// BPS internal catalogue number for documentation and archival purposes
  ///
  /// Internal reference number used by BPS for organizing and tracking
  /// classification documents within their publication system.
  final String? catalogueNumber;

  /// Publication number or version identifier for the classification
  ///
  /// Sequential numbering or version codes indicating specific editions
  /// or revisions of the classification system.
  final String? publicationNumber;

  /// Date when the classification was most recently updated or revised
  ///
  /// Tracks the currency of the classification to ensure users are working
  /// with the most current version of coding standards.
  final DateTime lastUpdate;

  /// Official release date when the classification became effective
  ///
  /// The date when this version of the classification was officially
  /// adopted and made available for statistical use.
  final DateTime releaseDate;

  /// Geographical or institutional location context for the classification
  ///
  /// Optional field indicating specific regional applicability or
  /// institutional context where the classification is primarily used.
  final String? location;

  /// URL for accessing additional resources and documentation
  ///
  /// Link to comprehensive documentation, manuals, or online tools
  /// related to the classification system.
  final String? url;

  /// Master File Data reference for administrative linkage
  ///
  /// Optional metadata field for linking with other administrative
  /// data systems and maintaining data consistency across platforms.
  final String? mfd;

  /// List of classification items from previous versions
  ///
  /// Historical classification codes and definitions that were used
  /// in earlier versions, enabling data continuity and comparison.
  final List<ClassificationItem> previous;

  /// List of derived or related classification items
  ///
  /// Classification codes that are based on or derived from this
  /// classification, showing relationships between different systems.
  final List<ClassificationItem> derived;

  /// Status flag indicating the current state of the classification
  ///
  /// Boolean indicator for classification status such as active/inactive,
  /// current/deprecated, or available/under-revision.
  final bool flag;

  /// Descriptive tags for classification discovery and organization
  ///
  /// Keywords and labels that help users discover relevant classifications
  /// by topic, industry, or application area.
  final List<String> tags;

  /// Creates a new instance of `StatisticClassification`.
  const StatisticClassification({
    required this.id,
    required this.source,
    required this.title,
    required this.description,
    required this.lastUpdate,
    required this.releaseDate,
    required this.previous,
    required this.derived,
    required this.flag,
    required this.tags,
    this.type,
    this.level,
    this.isbn,
    this.issn,
    this.catalogueNumber,
    this.publicationNumber,
    this.location,
    this.url,
    this.mfd,
  });

  @override
  List<Object?> get props => [
    id,
    type,
    source,
    title,
    description,
    lastUpdate,
    releaseDate,
    previous,
    derived,
    flag,
    tags,
    level,
    isbn,
    issn,
    catalogueNumber,
    publicationNumber,
    location,
    url,
    mfd,
  ];
}
