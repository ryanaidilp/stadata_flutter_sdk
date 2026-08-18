import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing census data categories from BPS Web API.
///
/// This class maps to the census categories endpoint and contains
/// classification information with items that help categorize census data
/// such as age groups (kelompok umur), gender (jenis kelamin),
/// education levels (tingkat pendidikan), or economic sectors (sektor ekonomi).
///
/// Categories provide hierarchical organization of census data to enable
/// detailed statistical analysis and cross-tabulation of demographic
/// and socioeconomic indicators.
class const CensusCategory({
  /// Unique identifier for the census category
  required final String id,

  /// Descriptive name of the category (e.g., "Age Group", "Gender", "Education Level")
  required final String name,

  /// Identifier for the specific item within this category
  required final String itemID,

  /// Standardized code for the category item used in data classification
  /// Follows BPS coding standards for statistical categorization
  required final String itemCode,

  /// Human-readable name/description of the category item
  /// (e.g., "15-19 years", "Male", "High School")
  required final String itemName,
}) extends BaseEntity {
  @override
  List<Object?> get props => [id, name, itemID, itemCode, itemName];
}
