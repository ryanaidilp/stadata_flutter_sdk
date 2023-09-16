// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/src/features/news_category/domain/entities/news_category.dart';

part 'news_category_model.freezed.dart';
part 'news_category_model.g.dart';

@freezed
abstract class NewsCategoryModel with _$NewsCategoryModel {
  factory NewsCategoryModel({
    @JsonKey(name: 'newscat_id') required String id,
    @JsonKey(name: 'newscat_name') required String name,
  }) = _NewsCategoryModel;
  factory NewsCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$NewsCategoryModelFromJson(json);
}

extension NewsCategoryModelX on NewsCategoryModel {
  NewsCategory toEntity() => NewsCategory(
        id: id,
        name: name,
      );
}
