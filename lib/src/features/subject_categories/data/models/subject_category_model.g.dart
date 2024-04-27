// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectCategoryModelImpl _$$SubjectCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubjectCategoryModelImpl(
      id: (json['subcat_id'] as num).toInt(),
      name: json['title'] as String,
    );

Map<String, dynamic> _$$SubjectCategoryModelImplToJson(
        _$SubjectCategoryModelImpl instance) =>
    <String, dynamic>{
      'subcat_id': instance.id,
      'title': instance.name,
    };
