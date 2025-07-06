import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing statistical publications from BPS Web API.
///
/// This class maps to the publications endpoint:
/// `https://webapi.bps.go.id/v1/api/list/publication`
///
/// Publications are official statistical reports, bulletins, and documents
/// published by BPS covering various aspects of Indonesian statistics including:
/// - Economic indicators and analysis
/// - Demographic and social statistics
/// - Regional and sectoral data
/// - Methodological reports and surveys
///
/// Each publication includes complete metadata such as ISSN, publication dates,
/// abstract, and direct access to PDF content. Publications follow international
/// standards for statistical documentation and are available for download
/// and citation in research and policy work.
///
/// Documentation: https://webapi.bps.go.id/documentation/#publication
class Publication extends BaseEntity {
  /// Creates a new [Publication] instance.
  const Publication({
    required this.id,
    required this.title,
    required this.issn,
    required this.cover,
    required this.pdf,
    required this.size,
    this.scheduledDate,
    this.releaseDate,
    this.updateDate,
    this.abstract,
    this.catalogueNumber,
    this.publicationNumber,
  });

  /// Unique identifier for the publication
  final String id;

  /// Official title of the statistical publication
  ///
  /// Examples: "Statistik Indonesia 2023", "Buletin Statistik Perdagangan Luar Negeri",
  /// "Indikator Kesejahteraan Rakyat"
  final String title;

  /// International Standard Serial Number (ISSN) for the publication
  ///
  /// Standard identifier for serial publications following international
  /// cataloging standards, enabling proper citation and library cataloging.
  final String issn;

  /// Planned or scheduled publication date
  ///
  /// The date when the publication was originally scheduled to be released,
  /// useful for tracking publication timelines and planning.
  final DateTime? scheduledDate;

  /// Actual release date when the publication became publicly available
  ///
  /// The official date when the publication was made accessible to the public
  /// through BPS channels and the Web API.
  final DateTime? releaseDate;

  /// Date of the most recent update or revision to the publication
  ///
  /// Tracks when corrections, additions, or revisions were made to
  /// the publication content after initial release.
  final DateTime? updateDate;

  /// URL of the publication's cover image
  ///
  /// Points to the cover image file, typically showing the publication title,
  /// BPS logo, and visual elements representing the content theme.
  final String cover;

  /// Direct download URL for the complete PDF document
  ///
  /// Provides access to the full publication content in PDF format,
  /// including all tables, charts, methodology, and appendices.
  final String pdf;

  /// File size of the publication (typically PDF size)
  ///
  /// Indicates the download size in human-readable format (e.g., "2.5 MB"),
  /// helping users estimate download time and storage requirements.
  final String size;

  /// Optional abstract or executive summary of the publication
  ///
  /// Provides a concise overview of the publication's scope, methodology,
  /// key findings, and significance for researchers and policymakers.
  final String? abstract;

  /// Optional BPS internal catalogue number for archival purposes
  ///
  /// Internal classification number used by BPS for organizing and
  /// tracking publications within their documentation system.
  final String? catalogueNumber;

  /// Optional publication series number or edition identifier
  ///
  /// Sequential numbering for recurring publications (e.g., "No. 45/2023")
  /// or edition information for updated versions of regular reports.
  final String? publicationNumber;

  @override
  List<Object?> get props => [
    id,
    title,
    issn,
    scheduledDate,
    releaseDate,
    updateDate,
    cover,
    pdf,
    size,
    abstract,
    catalogueNumber,
    publicationNumber,
  ];
}
