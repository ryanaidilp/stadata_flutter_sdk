// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaginationModel _$$_PaginationModelFromJson(Map<String, dynamic> json) =>
    _$_PaginationModel(
      total: json['total'] as int,
      page: json['page'] as int? ?? 0,
      pages: json['pages'] as int? ?? 0,
      perPage: json['per_page'] as int?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$_PaginationModelToJson(_$_PaginationModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'per_page': instance.perPage,
      'count': instance.count,
    };
