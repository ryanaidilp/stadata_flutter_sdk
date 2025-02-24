import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'inf_id';
const _titleKey = 'title';
const _imageKey = 'img';
const _categoryKey = 'category';
const _downloadKey = 'dl';
const _descKey = 'desc';

class InfographicModel extends Infographic {
  const InfographicModel({
    required super.id,
    required super.title,
    required super.image,
    required super.category,
    required super.downloadUrl,
    super.description,
  });

  InfographicModel copyWith({
    int? id,
    String? title,
    String? image,
    int? category,
    String? downloadUrl,
    ValueGetter<String?>? description,
  }) => InfographicModel(
    id: id ?? this.id,
    title: title ?? this.title,
    image: image ?? this.image,
    category: category ?? this.category,
    downloadUrl: downloadUrl ?? this.downloadUrl,
    description: description == null ? this.description : description(),
  );

  factory InfographicModel.fromJson(JSON json) => InfographicModel(
    id: json[_idKey] as int,
    title: json[_titleKey] as String,
    image: json[_imageKey] as String,
    category: json[_categoryKey] as int? ?? 0,
    downloadUrl: json[_downloadKey] as String,
    description: json[_descKey] as String?,
  );

  JSON toJson() => {
    _idKey: id,
    _titleKey: title,
    _imageKey: image,
    _categoryKey: category,
    _downloadKey: downloadUrl,
    _descKey: description,
  };
}
