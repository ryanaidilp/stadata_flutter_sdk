// ignore_for_file: public_member_api_docs, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

part 'subject_model.freezed.dart';
part 'subject_model.g.dart';

@freezed
abstract class SubjectModel with _$SubjectModel {
  factory SubjectModel({
    @JsonKey(name: 'sub_id') required int id,
    @JsonKey(name: 'title') required String name,
    @JsonKey(name: 'subcat_id', readValue: _categoryValueReader)
    SubjectCategoryModel? category,
    @JsonKey(name: 'ntabel') int? nTable,
  }) = _SubjectModel;
  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);
}

Object? _categoryValueReader(Map<dynamic, dynamic> json, String key) {
  if (json['subcat_id'] == null || json['subcat'] == null) {
    return null;
  }

  return SubjectCategoryModel(
    id: json['subcat_id'] as int,
    name: json['subcat'] as String,
  ).toJson();
}

extension SubjectModelX on SubjectModel {
  Subject toEntity() => Subject(
        id: id,
        name: name,
        nTable: nTable,
        category: category?.toEntity(),
      );
}
