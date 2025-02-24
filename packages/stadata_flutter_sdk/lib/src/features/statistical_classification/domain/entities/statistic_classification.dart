import 'package:stadata_flutter_sdk/src/core/base/base_entity.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Represents a statistical classification entity.
/// This class corresponds to the API data for statistical classifications.
///
/// See the [API Documentation](https://webapi.bps.go.id/documentation/#sc).
class StatisticClassification extends BaseEntity {
  /// Unique identifier for the statistical classification.
  final String id;

  /// Type of the classification (optional).
  final ClassificationType? type;

  /// Level of the classification (optional).
  final ClassificationLevel? level;

  /// Source of the classification.
  final String source;

  /// Title of the classification.
  final String title;

  /// Description of the classification.
  final String description;

  /// ISBN associated with the classification (optional).
  final String? isbn;

  /// ISSN associated with the classification (optional).
  final String? issn;

  /// Catalogue number of the classification (optional).
  final String? catalogueNumber;

  /// Publication number of the classification (optional).
  final String? publicationNumber;

  /// Last update date of the classification.
  final DateTime lastUpdate;

  /// Release date of the classification.
  final DateTime releaseDate;

  /// Location related to the classification (optional).
  final String? location;

  /// URL for additional information or resources (optional).
  final String? url;

  /// Metadata field (optional).
  final String? mfd;

  /// List of previous classification items.
  final List<ClassificationItem> previous;

  /// List of derived classification items.
  final List<ClassificationItem> derived;

  /// A flag indicating some state of the classification.
  final bool flag;

  /// List of tags associated with the classification.
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
