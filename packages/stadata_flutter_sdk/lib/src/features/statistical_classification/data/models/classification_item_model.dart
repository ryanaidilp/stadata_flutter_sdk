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
        code: json['kode'] as String,
        title: json['judul'] as String,
        description: json['deskripsi'] as String? ?? '',
      );

  JSON toJson() => {
        'kode': code,
        'judul': title,
        'deskripsi': description,
      };
}
