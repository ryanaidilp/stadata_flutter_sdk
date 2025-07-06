import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing a census data category.
///
/// Each category contains classification information with items
/// that help categorize the census data (e.g., age groups, gender, etc.).
class CensusCategory extends BaseEntity {
  /// Creates a new [CensusCategory] instance.
  const CensusCategory({
    required this.id,
    required this.name,
    required this.itemID,
    required this.itemCode,
    required this.itemName,
  });

  /// Category identifier
  final String id;

  /// Category name/description
  final String name;

  /// Category item identifier
  final String itemID;

  /// Category item code
  final String itemCode;

  /// Category item name/description
  final String itemName;

  @override
  List<Object?> get props => [
    id,
    name,
    itemID,
    itemCode,
    itemName,
  ];
}
