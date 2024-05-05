import 'package:stadata_flutter_sdk/src/core/base/base_entity.dart';

class ClassificationItem extends BaseEntity {
  final String code;
  final String title;
  final String description;

  const ClassificationItem({
    required this.code,
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [code, title, description];
}
