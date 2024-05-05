import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

class ClassificationItemModel extends ClassificationItem {
  const ClassificationItemModel({
    required super.code,
    required super.title,
    required super.description,
  });

  factory ClassificationItemModel.fromJson(JSON json) =>
      ClassificationItemModel(
        code: json['code'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
      );

  JSON toJson() => {
        'code': code,
        'title': title,
        'description': description,
      };
}
