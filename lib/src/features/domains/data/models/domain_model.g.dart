// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DomainModel _$$_DomainModelFromJson(Map<String, dynamic> json) =>
    _$_DomainModel(
      id: json['domain_id'] as String,
      name: json['domain_name'] as String,
      url: json['domain_url'] as String,
    );

Map<String, dynamic> _$$_DomainModelToJson(_$_DomainModel instance) =>
    <String, dynamic>{
      'domain_id': instance.id,
      'domain_name': instance.name,
      'domain_url': instance.url,
    };
