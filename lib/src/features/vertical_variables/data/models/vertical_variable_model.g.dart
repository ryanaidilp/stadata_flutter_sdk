// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertical_variable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerticalVariableModelImpl _$$VerticalVariableModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerticalVariableModelImpl(
      id: json['kode_ver_id'] as int,
      title: json['vervar'] as String,
      itemID: json['item_ver_id'] as int,
      groupID: json['group_ver_id'] as int,
      groupName: json['name_group_ver_id'] as String,
    );

Map<String, dynamic> _$$VerticalVariableModelImplToJson(
        _$VerticalVariableModelImpl instance) =>
    <String, dynamic>{
      'kode_ver_id': instance.id,
      'vervar': instance.title,
      'item_ver_id': instance.itemID,
      'group_ver_id': instance.groupID,
      'name_group_ver_id': instance.groupName,
    };
