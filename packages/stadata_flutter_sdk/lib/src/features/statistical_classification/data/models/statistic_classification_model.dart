// Model class inherits and overrides fields from entity for JSON serialization
// ignore_for_file: overridden_fields

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

class StatisticClassificationModel extends StatisticClassification {
  const StatisticClassificationModel({
    required super.id,
    required super.type,
    required super.source,
    required super.title,
    required super.description,
    required super.lastUpdate,
    required super.releaseDate,
    required this.previous,
    required this.derived,
    required super.flag,
    required super.tags,
    required super.level,
    super.issn,
    super.isbn,
    super.catalogueNumber,
    super.publicationNumber,
    super.location,
    super.url,
    super.mfd,
  }) : super(derived: derived, previous: previous);
  @override
  final List<ClassificationItemModel> previous;

  @override
  final List<ClassificationItemModel> derived;

  factory StatisticClassificationModel.fromJson(JSON json) {
    final classificationTypeString = json['jenis'] as String?;
    ClassificationType? classificationType;
    final classificationLevelString = json['level'] as String?;
    ClassificationLevel? classificationLevel;

    final previousData = json['sebelumnya'] as List<dynamic>? ?? [];
    final previous = <ClassificationItemModel>[];

    final derivedData = json['turunan'] as List<dynamic>? ?? [];
    final derived = <ClassificationItemModel>[];

    if (previousData.isNotEmpty) {
      final jsonData = previousData.map((e) => e as JSON);
      previous.addAll(jsonData.map(ClassificationItemModel.fromJson).toList());
    }
    if (derivedData.isNotEmpty) {
      final jsonData = derivedData.map((e) => e as JSON);
      derived.addAll(jsonData.map(ClassificationItemModel.fromJson).toList());
    }

    if (classificationLevelString != null) {
      if (classificationTypeString!.contains('kbli')) {
        classificationType = KBLIType.fromValue(classificationTypeString);
        classificationLevel = KBLILevel.fromValue(classificationLevelString);
      } else {
        classificationType = KBKIType.fromValue(classificationTypeString);
        classificationLevel = KBKILevel.fromValue(classificationLevelString);
      }
    }

    final tags = json['tags'] as List;

    return StatisticClassificationModel(
      id: json['id'] as String,
      type: classificationType,
      source: json['source'] as String,
      title: json['judul'] as String,
      description: json['deskripsi'] as String,
      lastUpdate: DateTime.parse(json['last_update'] as String),
      releaseDate: DateTime.parse(json['tgl_rilis'] as String),
      previous: previous,
      derived: derived,
      flag: json['flag'] as bool,
      tags: tags.map((e) => e.toString()).toList(),
      level: classificationLevel,
      catalogueNumber: json['no_katalog'] as String?,
      isbn: json['isbn'] as String?,
      issn: json['issn'] as String?,
      location: json['lokasi'] as String?,
      mfd: json['mfd'] as String?,
      publicationNumber: json['no_publikasi'] as String?,
      url: json['url'] as String?,
    );
  }

  JSON toJson() => {
    'id': id,
    'source': source,
    'judul': title,
    'deskripsi': description,
    'last_update': DateHelper.formatDate(lastUpdate),
    'tgl_rilis': DateHelper.formatDate(releaseDate),
    'sebelumnya': previous.map((e) => e.toJson()),
    'turunan': derived.map((e) => e.toJson()),
    'flag': flag,
    'tags': tags,
    'level': level?.value,
    'jenis': type?.value,
    'no_katalog': catalogueNumber,
    'isbn': isbn,
    'issn': issn,
    'lokasi': location,
    'mfd': mfd,
    'no_publikasi': publicationNumber,
    'url': url,
  };
}
