import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'pub_id';
const _titleKey = 'title';
const _issnKey = 'issn';
const _coverKey = 'cover';
const _pdfKey = 'pdf';
const _sizeKey = 'size';
const _scheduledDateKey = 'sch_date';
const _releaseDateKey = 'rl_date';
const _updateDateKey = 'updt_date';
const _abstractKey = 'abstract';
const _catalogueNumberKey = 'kat_no';
const _publicationNumberKey = 'pub_no';
const _relatedKey = 'related';

class PublicationModel extends Publication {
  const PublicationModel({
    required super.id,
    required super.title,
    required super.issn,
    required super.cover,
    required super.pdf,
    required super.size,
    super.scheduledDate,
    super.releaseDate,
    super.updateDate,
    super.abstract,
    super.catalogueNumber,
    super.publicationNumber,
    super.relatedPublications = const [],
  });

  PublicationModel copyWith({
    String? id,
    String? title,
    String? issn,
    String? cover,
    String? pdf,
    String? size,
    ValueGetter<DateTime?>? scheduledDate,
    ValueGetter<DateTime?>? releaseDate,
    ValueGetter<DateTime?>? updateDate,
    ValueGetter<String?>? abstract,
    ValueGetter<String?>? catalogueNumber,
    ValueGetter<String?>? publicationNumber,
    List<RelatedPublication>? relatedPublications,
  }) => PublicationModel(
    id: id ?? this.id,
    title: title ?? this.title,
    issn: issn ?? this.issn,
    cover: cover ?? this.cover,
    pdf: pdf ?? this.pdf,
    size: size ?? this.size,
    scheduledDate: scheduledDate?.call() ?? this.scheduledDate,
    releaseDate: releaseDate?.call() ?? this.releaseDate,
    updateDate: updateDate?.call() ?? this.updateDate,
    abstract: abstract?.call() ?? this.abstract,
    catalogueNumber: catalogueNumber?.call() ?? this.catalogueNumber,
    publicationNumber: publicationNumber?.call() ?? this.publicationNumber,
    relatedPublications: relatedPublications ?? this.relatedPublications,
  );

  factory PublicationModel.fromJson(JSON json) => PublicationModel(
    id: json[_idKey] as String,
    title: json[_titleKey] as String,
    issn: json[_issnKey] as String,
    cover: json[_coverKey] as String,
    pdf: json[_pdfKey] as String,
    size: json[_sizeKey] as String,
    scheduledDate:
        json[_scheduledDateKey] != null
            ? DateTime.parse(json[_scheduledDateKey] as String)
            : null,
    releaseDate:
        json[_releaseDateKey] != null
            ? DateTime.parse(json[_releaseDateKey] as String)
            : null,
    updateDate:
        json[_updateDateKey] != null
            ? DateTime.parse(json[_updateDateKey] as String)
            : null,
    abstract: json[_abstractKey] as String?,
    catalogueNumber: json[_catalogueNumberKey] as String?,
    publicationNumber: json[_publicationNumberKey] as String?,
    relatedPublications:
        json[_relatedKey] != null
            ? (json[_relatedKey] as List<dynamic>)
                .map((e) => RelatedPublicationModel.fromJson(e as JSON))
                .toList()
            : const [],
  );

  JSON toJson() => {
    _idKey: id,
    _titleKey: title,
    _issnKey: issn,
    _coverKey: cover,
    _pdfKey: pdf,
    _sizeKey: size,
    _scheduledDateKey: scheduledDate?.toIso8601String(),
    _releaseDateKey: releaseDate?.toIso8601String(),
    _updateDateKey: updateDate?.toIso8601String(),
    _abstractKey: abstract,
    _catalogueNumberKey: catalogueNumber,
    _publicationNumberKey: publicationNumber,
    _relatedKey:
        relatedPublications
            .map((e) => RelatedPublicationModel.fromEntity(e).toJson())
            .toList(),
  };

  factory PublicationModel.fromEntity(Publication publication) =>
      PublicationModel(
        id: publication.id,
        title: publication.title,
        issn: publication.issn,
        cover: publication.cover,
        pdf: publication.pdf,
        size: publication.size,
        abstract: publication.abstract,
        catalogueNumber: publication.catalogueNumber,
        publicationNumber: publication.publicationNumber,
        releaseDate: publication.releaseDate,
        scheduledDate: publication.scheduledDate,
        updateDate: publication.updateDate,
        relatedPublications: publication.relatedPublications,
      );
}
