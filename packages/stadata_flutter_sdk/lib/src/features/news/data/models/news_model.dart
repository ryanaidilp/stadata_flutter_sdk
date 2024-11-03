import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'news_id';
const _titleKey = 'title';
const _newsKey = 'news';
const _newsCategoryIDKey = 'newscat_id';
const _pictureKey = 'picture';
const _releaseDateKey = 'rl_date';
const _newsCategoryNameKey = 'newscat_name';
const _newsTypeKey = 'news_type';

class NewsModel extends News {
  const NewsModel({
    required super.id,
    required super.title,
    required super.content,
    required super.releaseDate,
    required super.picture,
    required super.categoryID,
    required super.category,
  });

  NewsModel copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? releaseDate,
    String? picture,
    String? categoryID,
    String? category,
  }) =>
      NewsModel(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        releaseDate: releaseDate ?? this.releaseDate,
        picture: picture ?? this.picture,
        categoryID: categoryID ?? this.categoryID,
        category: category ?? this.category,
      );

  factory NewsModel.fromJson(JSON json) => NewsModel(
        id: json[_idKey] as int,
        title: json[_titleKey] as String,
        content: const NewsConverter().fromJson(json[_newsKey] as String),
        releaseDate: DateTime.parse(json[_releaseDateKey] as String),
        picture: json[_pictureKey] as String,
        categoryID: _newsCategoryNameValueReader(
          json,
          _newsCategoryIDKey,
        ),
        category: json[_newsCategoryNameKey] as String,
      );

  JSON toJson() => {
        _idKey: id,
        _titleKey: title,
        _newsKey: const NewsConverter().toJson(content),
        _releaseDateKey: releaseDate.toIso8601String(),
        _pictureKey: picture,
        _newsCategoryIDKey: categoryID,
        _newsCategoryNameKey: category,
      };
}

String _newsCategoryNameValueReader(
  Map<dynamic, dynamic> json,
  String key,
) {
  if (json[key] != null) {
    return json[key] as String;
  } else if (json[_newsTypeKey] != null) {
    return json[_newsTypeKey] as String;
  }

  return '';
}
