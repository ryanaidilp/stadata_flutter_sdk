// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'brs_id';
const _titleKey = 'title';
const _releaseDateKey = 'rl_date';
const _pdfKey = 'pdf';
const _slideKey = 'slide';
const _sizeKey = 'size';
const _thumbnailKey = 'thumbnail';
const _abstractKey = 'abstract';
const _subjectKey = 'subj';
const _subjectIDKey = 'subj_id';
const _updateAtKey = 'updt_date';

class PressReleaseModel extends PressRelease {
  const PressReleaseModel({
    required super.id,
    required super.title,
    required super.releaseDate,
    required super.pdf,
    required super.slide,
    required super.size,
    required super.cover,
    SubjectModel? super.subject,
    super.abstract,
    super.updatedAt,
  });

  PressReleaseModel copyWith({
    int? id,
    String? title,
    DateTime? releaseDate,
    String? pdf,
    String? slide,
    String? size,
    String? cover,
    ValueGetter<String?>? abstract,
    ValueGetter<SubjectModel?>? subject,
    ValueGetter<DateTime?>? updatedAt,
  }) =>
      PressReleaseModel(
        id: id ?? this.id,
        title: title ?? this.title,
        releaseDate: releaseDate ?? this.releaseDate,
        pdf: pdf ?? this.pdf,
        size: size ?? this.size,
        slide: slide ?? this.slide,
        cover: cover ?? this.cover,
        abstract: abstract != null ? abstract() : this.abstract,
        subject: subject != null ? subject() : (this.subject as SubjectModel?),
        updatedAt: updatedAt != null ? updatedAt() : this.updatedAt,
      );

  factory PressReleaseModel.fromJson(JSON json) => PressReleaseModel(
        id: json[_idKey] as int,
        title: json[_titleKey] as String,
        releaseDate: DateTime.parse(json[_releaseDateKey] as String).toLocal(),
        pdf: json[_pdfKey] as String,
        slide: json[_slideKey] as String,
        size: json[_sizeKey] as String,
        cover: json[_thumbnailKey] as String,
        abstract: const AbstractConverter().fromJson(
          json[_abstractKey] as String?,
        ),
        subject: _subjectValueReader(json, _subjectKey) == null
            ? null
            : SubjectModel.fromJson(
                _subjectValueReader(json, _subjectKey)! as JSON,
              ),
      );

  JSON toJson() => {
        _idKey: id,
        _titleKey: title,
        _releaseDateKey: releaseDate.toUtc().toIso8601String(),
        _pdfKey: pdf,
        _slideKey: slide,
        _sizeKey: size,
        _thumbnailKey: cover,
        _abstractKey: const AbstractConverter().toJson(abstract),
        _subjectKey: (subject as SubjectModel?)?.toJson(),
      };
}

Object? _subjectValueReader(Map<dynamic, dynamic> json, String key) {
  if (json['subj'] == null || json['subj_id'] == null) {
    return null;
  }

  return SubjectModel(
    id: json['subj_id'] as int,
    name: json['subj'] as String,
  ).toJson();
}
