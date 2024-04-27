// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

part 'subject_category_model.freezed.dart';
part 'subject_category_model.g.dart';

@freezed
abstract class SubjectCategoryModel with _$SubjectCategoryModel {
  factory SubjectCategoryModel({
    @JsonKey(name: 'subcat_id') required int id,
    @JsonKey(name: 'title') required String name,
  }) = _SubjectCategoryModel;
  factory SubjectCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectCategoryModelFromJson(json);
}

extension SubjectCategoryModelX on SubjectCategoryModel {
  SubjectCategory toEntity() => SubjectCategory(
        id: id,
        name: name,
      );
}
