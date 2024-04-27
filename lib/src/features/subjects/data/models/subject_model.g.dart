// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectModelImpl _$$SubjectModelImplFromJson(Map<String, dynamic> json) =>
    _$SubjectModelImpl(
      id: (json['sub_id'] as num).toInt(),
      name: json['title'] as String,
      category: _categoryValueReader(json, 'subcat_id') == null
          ? null
          : SubjectCategoryModel.fromJson(
              _categoryValueReader(json, 'subcat_id') as Map<String, dynamic>),
      nTable: (json['ntabel'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SubjectModelImplToJson(_$SubjectModelImpl instance) =>
    <String, dynamic>{
      'sub_id': instance.id,
      'title': instance.name,
      'subcat_id': instance.category,
      'ntabel': instance.nTable,
    };
