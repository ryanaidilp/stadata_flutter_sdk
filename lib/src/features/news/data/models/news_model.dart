// ignore_for_file: public_member_api_docs, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/entities/news.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
abstract class NewsModel with _$NewsModel {
  factory NewsModel({
    @JsonKey(name: 'news_id') required int id,
    required String title,
    @JsonKey(name: 'news') required String content,
    @JsonKey(name: 'newscat_id', readValue: _newsCatIdValueReader)
    required String categoryId,
    required String picture,
    @JsonKey(name: 'rl_date') required DateTime releaseDate,
    @JsonKey(name: 'newscat_name') String? category,
  }) = _NewsModel;
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}

Object? _newsCatIdValueReader(Map<dynamic, dynamic> json, String key) {
  if (json[key] != null) {
    return json[key];
  }

  return json['news_type'];
}

extension NewsModelX on NewsModel {
  News toEntity() => News(
        id: id,
        title: title,
        content: content,
        releaseDate: releaseDate,
        picture: picture,
        categoryId: categoryId,
        category: category,
      );
}
