// Model class doesn't require public documentation for internal implementation
// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'kode_ver_id';
const _titleKey = 'vervar';
const _itemVerticalIDKey = 'item_ver_id';
const _groupVerticalIDKey = 'group_ver_id';
const _nameGroupVerticalIDKey = 'name_group_ver_id';

class VerticalVariableModel extends VerticalVariable {
  const VerticalVariableModel({
    required super.id,
    required super.title,
    required super.itemID,
    super.groupID,
    super.groupName,
  });

  factory VerticalVariableModel.fromJson(JSON json) => VerticalVariableModel(
    id: json[_idKey] as int,
    title: json[_titleKey] as String,
    itemID: json[_itemVerticalIDKey] as int,
    groupID: json[_groupVerticalIDKey] as int?,
    groupName: json[_nameGroupVerticalIDKey] as String?,
  );

  JSON toJson() => {
    _idKey: id,
    _titleKey: title,
    _itemVerticalIDKey: itemID,
    _groupVerticalIDKey: groupID,
    _nameGroupVerticalIDKey: groupName,
  };

  VerticalVariableModel copyWith({
    int? id,
    String? title,
    int? itemID,
    ValueGetter<int?>? groupID,
    ValueGetter<String?>? groupName,
  }) => VerticalVariableModel(
    id: id ?? this.id,
    title: title ?? this.title,
    itemID: itemID ?? this.itemID,
    groupID: groupID != null ? groupID() : this.groupID,
    groupName: groupName != null ? groupName() : this.groupName,
  );
}
