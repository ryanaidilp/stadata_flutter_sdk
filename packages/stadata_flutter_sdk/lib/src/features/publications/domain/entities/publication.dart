import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Dart class representation of BPS Statistics Publication
///
/// docs: https://webapi.bps.go.id/documentation/#publication
class Publication extends BaseEntity {
  /// Constructor of Publication
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

  /// Unique identifier for the publication.
  final String id;

  /// The title of the publication.
  final String title;

  /// The International Standard Serial Number (ISSN) of the publication.
  final String issn;

  /// The scheduled date for the publication.
  final DateTime? scheduledDate;

  /// The release date of the publication.
  final DateTime? releaseDate;

  /// The date when the publication was last updated.
  final DateTime? updateDate;

  /// The cover image URL of the publication.
  final String cover;

  /// The PDF file URL of the publication.
  final String pdf;

  /// The size of the publication (e.g., file size).
  final String size;

  /// An optional abstract or summary of the publication.
  final String? abstract;

  /// An optional catalogue number associated with the publication.
  final String? catalogueNumber;

  /// An optional publication number or code.
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
