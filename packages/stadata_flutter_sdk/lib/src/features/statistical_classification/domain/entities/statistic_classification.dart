import 'package:stadata_flutter_sdk/src/core/base/base_entity.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

class StatisticClassification extends BaseEntity {
  final String id;
  final ClassificationType type;
  final ClassificationLevel level;
  final String source;
  final String title;
  final String description;
  final String? isbn;
  final String? issn;
  final String? catalogueNumber;
  final String? publicationNumber;
  final DateTime lastUpdate;
  final DateTime releaseDate;
  final String? location;
  final String? url;
  final String? mfd;
  final List<ClassificationItem> previous;
  final List<ClassificationItem> derived;
  final bool flag;
  final List<String> tags;

  const StatisticClassification({
    required this.id,
    required this.type,
    required this.source,
    required this.title,
    required this.description,
    required this.lastUpdate,
    required this.releaseDate,
    required this.previous,
    required this.derived,
    required this.flag,
    required this.tags,
    required this.level,
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
