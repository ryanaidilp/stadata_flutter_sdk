import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'pub_id';
const _titleKey = 'title';
const _releaseDateKey = 'rl_date';
const _urlKey = 'url';
const _coverKey = 'cover';

class RelatedPublicationModel extends RelatedPublication {
  const RelatedPublicationModel({
    required super.id,
    required super.title,
    required super.releaseDate,
    required super.url,
    required super.cover,
  });

  factory RelatedPublicationModel.fromJson(JSON json) =>
      RelatedPublicationModel(
        id: json[_idKey] as String,
        title: json[_titleKey] as String,
        releaseDate: DateTime.parse(json[_releaseDateKey] as String),
        url: json[_urlKey] as String,
        cover: json[_coverKey] as String,
      );

  JSON toJson() => {
    _idKey: id,
    _titleKey: title,
    _releaseDateKey: releaseDate.toIso8601String(),
    _urlKey: url,
    _coverKey: cover,
  };

  factory RelatedPublicationModel.fromEntity(
    RelatedPublication relatedPublication,
  ) => RelatedPublicationModel(
    id: relatedPublication.id,
    title: relatedPublication.title,
    releaseDate: relatedPublication.releaseDate,
    url: relatedPublication.url,
    cover: relatedPublication.cover,
  );
}
