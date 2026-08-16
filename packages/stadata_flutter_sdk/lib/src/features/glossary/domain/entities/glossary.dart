import 'package:stadata_flutter_sdk/src/core/core.dart';

class const Glossary({
  required final int id,
  required final String title,
  required final String description,
  final String? url,
}) extends BaseEntity {
  @override
  List<Object?> get props => [id, title, description, url];
}
