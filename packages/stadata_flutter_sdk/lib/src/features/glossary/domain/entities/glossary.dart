import 'package:stadata_flutter_sdk/src/core/core.dart';

class const Glossary({
  required this.id,
  required this.title,
  required this.description,
  this.url,
}) extends BaseEntity {
  final int id;
  final String title;
  final String description;
  final String? url;

  @override
  List<Object?> get props => [id, title, description, url];
}
