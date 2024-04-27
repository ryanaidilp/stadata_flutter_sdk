// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infographic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InfographicModelImpl _$$InfographicModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InfographicModelImpl(
      id: (json['inf_id'] as num).toInt(),
      title: json['title'] as String,
      image: json['img'] as String,
      category: (json['category'] as num).toInt(),
      downloadUrl: json['dl'] as String,
      description: json['desc'] as String?,
    );

Map<String, dynamic> _$$InfographicModelImplToJson(
        _$InfographicModelImpl instance) =>
    <String, dynamic>{
      'inf_id': instance.id,
      'title': instance.title,
      'img': instance.image,
      'category': instance.category,
      'dl': instance.downloadUrl,
      'desc': instance.description,
    };
