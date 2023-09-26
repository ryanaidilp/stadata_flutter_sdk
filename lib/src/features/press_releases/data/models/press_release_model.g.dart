// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'press_release_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PressReleaseModel _$$_PressReleaseModelFromJson(Map<String, dynamic> json) =>
    _$_PressReleaseModel(
      id: json['brs_id'] as int,
      subject: _subjectValueReader(json, 'subj') == null
          ? null
          : SubjectModel.fromJson(
              _subjectValueReader(json, 'subj') as Map<String, dynamic>),
      title: json['title'] as String,
      abstract: const AbstractSerializer().fromJson(json['abstract'] as String),
      releaseDate: DateTime.parse(json['rl_date'] as String),
      pdf: json['pdf'] as String,
      slide: json['slide'] as String,
      size: json['size'] as String,
      cover: json['thumbnail'] as String,
      updatedAt: json['updt_date'] == null
          ? null
          : DateTime.parse(json['updt_date'] as String),
    );

Map<String, dynamic> _$$_PressReleaseModelToJson(
        _$_PressReleaseModel instance) =>
    <String, dynamic>{
      'brs_id': instance.id,
      'subj': instance.subject,
      'title': instance.title,
      'abstract': const AbstractSerializer().toJson(instance.abstract),
      'rl_date': instance.releaseDate.toIso8601String(),
      'pdf': instance.pdf,
      'slide': instance.slide,
      'size': instance.size,
      'thumbnail': instance.cover,
      'updt_date': instance.updatedAt?.toIso8601String(),
    };
