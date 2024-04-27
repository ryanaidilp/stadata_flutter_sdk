// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      id: (json['news_id'] as num).toInt(),
      title: json['title'] as String,
      content: const NewsSerializer().fromJson(json['news'] as String),
      categoryID: _newsCatIdValueReader(json, 'newscat_id') as String,
      picture: json['picture'] as String,
      releaseDate: DateTime.parse(json['rl_date'] as String),
      category: json['newscat_name'] as String?,
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'news_id': instance.id,
      'title': instance.title,
      'news': const NewsSerializer().toJson(instance.content),
      'newscat_id': instance.categoryID,
      'picture': instance.picture,
      'rl_date': instance.releaseDate.toIso8601String(),
      'newscat_name': instance.category,
    };
