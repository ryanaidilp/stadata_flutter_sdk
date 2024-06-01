import 'package:stadata_flutter_sdk/src/core/base/base_entity.dart';

/// Represents a single classification item entity.
/// This class corresponds to individual items within a statistical classification.
///
/// See the [API Documentation](https://webapi.bps.go.id/documentation/#sc).
class ClassificationItem extends BaseEntity {
  /// Code of the classification item.
  final String code;

  /// Title of the classification item.
  final String title;

  /// Description of the classification item.
  final String description;

  /// Creates a new instance of `ClassificationItem`.
  const ClassificationItem({
    required this.code,
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [code, title, description];
}
