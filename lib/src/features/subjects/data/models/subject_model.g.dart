// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubjectModel _$$_SubjectModelFromJson(Map<String, dynamic> json) =>
    _$_SubjectModel(
      id: json['sub_id'] as int,
      name: json['title'] as String,
      category: _categoryValueReader(json, 'subcat_id') == null
          ? null
          : SubjectCategoryModel.fromJson(
              _categoryValueReader(json, 'subcat_id') as Map<String, dynamic>),
      nTable: json['ntabel'] as int?,
    );

Map<String, dynamic> _$$_SubjectModelToJson(_$_SubjectModel instance) =>
    <String, dynamic>{
      'sub_id': instance.id,
      'title': instance.name,
      'subcat_id': instance.category,
      'ntabel': instance.nTable,
    };
