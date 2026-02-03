import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// Entity class representing press releases from BPS Web API.
///
/// This class maps to the press releases endpoint:
/// `https://webapi.bps.go.id/v1/api/list/pressrelease`
///
/// Press releases are official statements issued by BPS to announce significant
/// statistical findings, data releases, and analytical insights. They serve as
/// the primary communication tool for disseminating important statistical
/// information to media, government agencies, and the public.
///
/// Press releases typically cover:
/// - Major economic indicators (GDP, inflation, employment)
/// - Census and survey results announcements
/// - Monthly and quarterly statistical bulletins
/// - Special statistical reports and analysis
/// - Methodological updates and improvements
/// - International cooperation and statistical events
///
/// Each press release includes comprehensive documentation with PDF reports,
/// presentation slides, cover images, and abstracts to provide complete
/// information packages for media coverage and public understanding.
///
/// Documentation: https://webapi.bps.go.id/documentation/#press-release
class PressRelease extends BaseEntity {
  /// Creates a new [PressRelease] instance.
  const PressRelease({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.pdf,
    required this.size,
    required this.cover,
    required this.slide,
    this.abstract,
    this.subject,
    this.updatedAt,
  });

  /// Unique identifier for the press release
  final int id;

  /// Statistical subject area that this press release covers
  ///
  /// Links to the relevant statistical domain or subject classification,
  /// providing thematic context for the press release content.
  final Subject? subject;

  /// Official headline title of the press release
  ///
  /// Formal title used for media distribution and official announcements.
  /// Examples: "Inflasi Februari 2024 Sebesar 0,43 Persen",
  /// "Ekonomi Indonesia Triwulan III-2024 Tumbuh 4,95 Persen"
  final String title;

  /// Executive summary or abstract of the press release content
  ///
  /// Concise overview highlighting key statistical findings, methodology,
  /// and significance of the data being announced. Provides context for
  /// media and public understanding.
  final String? abstract;

  /// Official publication date of the press release
  ///
  /// The date when the press release was officially issued and made
  /// available to media outlets and the public.
  final DateTime releaseDate;

  /// Date of the most recent update or revision to the press release
  ///
  /// Tracks when corrections, clarifications, or additional information
  /// were added to the original press release after publication.
  final DateTime? updatedAt;

  /// Direct download URL for the complete press release PDF document
  ///
  /// Provides access to the full official document including detailed
  /// statistical tables, charts, methodology, and comprehensive analysis.
  final String pdf;

  /// File size of the press release PDF document
  ///
  /// Indicates download size in human-readable format (e.g., "1.2 MB")
  /// to help users estimate download time and storage requirements.
  final String size;

  /// URL of the cover image for the press release
  ///
  /// Points to the official cover or header image that represents the
  /// press release visually, typically including BPS branding and key graphics.
  final String cover;

  /// URL for downloadable presentation slides accompanying the press release
  ///
  /// Provides access to PowerPoint or PDF slides used in press conferences
  /// or briefings, offering visual summaries of the statistical data.
  final String slide;

  @override
  List<Object?> get props => [
    id,
    subject,
    title,
    abstract,
    releaseDate,
    updatedAt,
    pdf,
    size,
    cover,
    slide,
  ];
}
