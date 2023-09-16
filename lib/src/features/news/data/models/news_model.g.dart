// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsModel _$$_NewsModelFromJson(Map<String, dynamic> json) => _$_NewsModel(
      id: json['news_id'] as int,
      title: json['title'] as String,
      content: json['news'] as String,
      categoryId: _newsCatIdValueReader(json, 'newscat_id') as String,
      picture: json['picture'] as String,
      releaseDate: DateTime.parse(json['rl_date'] as String),
      category: json['newscat_name'] as String?,
    );

Map<String, dynamic> _$$_NewsModelToJson(_$_NewsModel instance) =>
    <String, dynamic>{
      'news_id': instance.id,
      'title': instance.title,
      'news': instance.content,
      'newscat_id': instance.categoryId,
      'picture': instance.picture,
      'rl_date': instance.releaseDate.toIso8601String(),
      'newscat_name': instance.category,
    };
