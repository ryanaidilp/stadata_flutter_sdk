import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'glos_id';
const _titleKey = 'title';
const _descriptionKey = 'description';
const _urlKey = 'url';

class GlossaryModel extends Glossary {
  const GlossaryModel({
    required super.id,
    required super.title,
    required super.description,
    super.url,
  });

  GlossaryModel copyWith({
    int? id,
    String? title,
    String? description,
    String? url,
  }) => GlossaryModel(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    url: url ?? this.url,
  );

  factory GlossaryModel.fromJson(JSON json) => GlossaryModel(
    id: json[_idKey] as int,
    title: json[_titleKey] as String,
    description: json[_descriptionKey] as String,
    url: json[_urlKey] as String?,
  );

  JSON toJson() => {
    _idKey: id,
    _titleKey: title,
    _descriptionKey: description,
    _urlKey: url,
  };
}
