import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing vertical variables from BPS Web API.
///
/// This class maps to the vertical variables endpoint:
/// `https://webapi.bps.go.id/v1/api/list/verticalvariable`
///
/// Vertical variables represent categorical dimensions or classification systems
/// used to organize and break down statistical data into meaningful sub-categories.
/// They provide the dimensional structure that enables cross-tabulation,
/// disaggregation, and detailed analysis of statistical variables.
///
/// Vertical variables serve essential analytical functions:
/// - Provide categorical breakdowns for statistical variables
/// - Enable cross-tabulation and multidimensional analysis
/// - Support disaggregation by demographic, geographic, or economic characteristics
/// - Facilitate comparison across different population groups or categories
/// - Enable construction of detailed statistical tables and reports
///
/// Common types of vertical variables include:
/// - Geographic breakdowns (province, regency, urban/rural)
/// - Demographic characteristics (age groups, gender, education level)
/// - Economic classifications (industry sectors, occupation types)
/// - Time periods (years, quarters, months)
/// - Administrative units (government levels, institutional categories)
///
/// Each vertical variable contains hierarchical item structures that
/// organize categories from broad groupings to specific classifications,
/// supporting both summary and detailed statistical reporting.
///
/// Documentation: https://webapi.bps.go.id/documentation/#dynamicdata_7
///
class VerticalVariable extends BaseEntity {
  /// Creates a new [VerticalVariable] instance.
  const VerticalVariable({
    required this.id,
    required this.title,
    required this.itemID,
    this.groupID,
    this.groupName,
  });

  /// Unique identifier for the vertical variable within BPS system
  ///
  /// Corresponds to 'kode_ver_id' in the API response and provides
  /// systematic identification for vertical variables across datasets.
  final int id;

  /// Descriptive name of the vertical variable category
  ///
  /// Maps to 'vervar' in the API response and represents the categorical
  /// dimension name. Examples: "Provinsi", "Kelompok Umur", "Jenis Kelamin",
  /// "Lapangan Usaha", "Tingkat Pendidikan"
  final String title;

  /// Identifier for specific items within the vertical variable structure
  ///
  /// Corresponds to 'item_ver_id' and specifies particular categorical
  /// elements or values within the vertical variable classification.
  final int itemID;

  /// Optional identifier for hierarchical grouping within the variable
  ///
  /// Maps to 'group_ver_id' and enables organization of related items
  /// into higher-level groupings for summary reporting and analysis.
  final int? groupID;

  /// Optional name of the hierarchical group containing this variable
  ///
  /// Corresponds to 'name_group_ver_id' and provides human-readable
  /// identification of the group structure for organizational purposes.
  final String? groupName;

  @override
  List<Object?> get props => [id, title, itemID, groupID, groupName];
}
