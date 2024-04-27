// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'press_release_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PressReleaseModelImpl _$$PressReleaseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PressReleaseModelImpl(
      id: (json['brs_id'] as num).toInt(),
      title: json['title'] as String,
      releaseDate: DateTime.parse(json['rl_date'] as String),
      pdf: json['pdf'] as String,
      slide: json['slide'] as String,
      size: json['size'] as String,
      cover: json['thumbnail'] as String,
      abstract:
          const AbstractSerializer().fromJson(json['abstract'] as String?),
      subject: _subjectValueReader(json, 'subj') == null
          ? null
          : SubjectModel.fromJson(
              _subjectValueReader(json, 'subj') as Map<String, dynamic>),
      updatedAt: json['updt_date'] == null
          ? null
          : DateTime.parse(json['updt_date'] as String),
    );

Map<String, dynamic> _$$PressReleaseModelImplToJson(
        _$PressReleaseModelImpl instance) =>
    <String, dynamic>{
      'brs_id': instance.id,
      'title': instance.title,
      'rl_date': instance.releaseDate.toIso8601String(),
      'pdf': instance.pdf,
      'slide': instance.slide,
      'size': instance.size,
      'thumbnail': instance.cover,
      'abstract': const AbstractSerializer().toJson(instance.abstract),
      'subj': instance.subject,
      'updt_date': instance.updatedAt?.toIso8601String(),
    };
