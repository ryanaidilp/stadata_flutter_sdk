// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infographic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InfographicModel _$$_InfographicModelFromJson(Map<String, dynamic> json) =>
    _$_InfographicModel(
      id: json['inf_id'] as int,
      title: json['title'] as String,
      image: json['img'] as String,
      description: json['desc'] as String?,
      category: json['category'] as int,
      downloadUrl: json['dl'] as String,
    );

Map<String, dynamic> _$$_InfographicModelToJson(_$_InfographicModel instance) =>
    <String, dynamic>{
      'inf_id': instance.id,
      'title': instance.title,
      'img': instance.image,
      'desc': instance.description,
      'category': instance.category,
      'dl': instance.downloadUrl,
    };
