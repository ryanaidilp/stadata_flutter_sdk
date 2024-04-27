// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DomainModelImpl _$$DomainModelImplFromJson(Map<String, dynamic> json) =>
    _$DomainModelImpl(
      id: json['domain_id'] as String,
      name: json['domain_name'] as String,
      url: json['domain_url'] as String,
    );

Map<String, dynamic> _$$DomainModelImplToJson(_$DomainModelImpl instance) =>
    <String, dynamic>{
      'domain_id': instance.id,
      'domain_name': instance.name,
      'domain_url': instance.url,
    };
