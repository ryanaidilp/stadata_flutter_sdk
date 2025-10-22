// Model class doesn't require public docs, JSON annotation targets may be invalid for code generation

import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'sub_id';
const _titleKey = 'title';
const _subCategoryKey = 'subcat';
const _subCategoryIDKey = 'subcat_id';
const _nTableKey = 'ntabel';

class SubjectModel extends Subject {
  const SubjectModel({
    required super.id,
    required super.name,
    super.nTable,
    SubjectCategoryModel? super.category,
  });

  SubjectModel copyWith({
    int? id,
    String? name,
    ValueGetter<SubjectCategoryModel?>? category,
    ValueGetter<int?>? nTable,
  }) => SubjectModel(
    id: id ?? this.id,
    name: name ?? this.name,
    nTable: nTable != null ? nTable() : this.nTable,
    category:
        category != null
            ? category()
            : (this.category as SubjectCategoryModel?),
  );

  factory SubjectModel.fromJson(JSON json) => SubjectModel(
    id: json[_idKey] as int,
    name: json[_titleKey] as String,
    nTable: (json[_nTableKey] as num?)?.toInt(),
    category:
        _categoryValueReader(json, _subCategoryIDKey) == null
            ? null
            : SubjectCategoryModel.fromJson(
              _categoryValueReader(json, _subCategoryIDKey)! as JSON,
            ),
  );

  JSON toJson() => {
    _idKey: id,
    _titleKey: name,
    _nTableKey: nTable,
    _subCategoryIDKey: (category as SubjectCategoryModel?)?.toJson(),
  };
}

Object? _categoryValueReader(Map<dynamic, dynamic> json, String key) {
  if (json[_subCategoryIDKey] == null || json[_subCategoryKey] == null) {
    return null;
  }

  return SubjectCategoryModel(
    id: json[_subCategoryIDKey] as int,
    name: json[_subCategoryKey] as String,
  ).toJson();
}
