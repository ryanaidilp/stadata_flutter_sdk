import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'subcat_id';
const _titleKey = 'title';

class SubjectCategoryModel extends SubjectCategory {
  const SubjectCategoryModel({
    required super.id,
    required super.name,
  });

  SubjectCategoryModel copyWith({
    int? id,
    String? name,
  }) =>
      SubjectCategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory SubjectCategoryModel.fromJson(JSON json) => SubjectCategoryModel(
        id: json[_idKey] as int,
        name: json[_titleKey] as String,
      );

  JSON toJson() => {
        _idKey: id,
        _titleKey: name,
      };
}
