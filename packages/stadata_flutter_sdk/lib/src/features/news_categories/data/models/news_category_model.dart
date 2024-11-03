// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'newscat_id';
const _nameKey = 'newscat_name';

class NewsCategoryModel extends NewsCategory {
  const NewsCategoryModel({
    required super.id,
    required super.name,
  });

  NewsCategoryModel copyWith({
    String? id,
    String? name,
  }) =>
      NewsCategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory NewsCategoryModel.fromJson(JSON json) => NewsCategoryModel(
        id: json[_idKey] as String,
        name: json[_nameKey] as String,
      );

  JSON toJson() => {
        _idKey: id,
        _nameKey: name,
      };
}
