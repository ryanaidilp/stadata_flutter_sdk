import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing derived/grouped variables from BPS Web API.
///
/// This class maps to the derived variables endpoint:
/// `https://webapi.bps.go.id/v1/api/list?model=turvar`
///
/// Derived variables (turvar) represent calculated or transformed variables—
/// aggregations or groupings across base variables. Unlike standard variables (var)
/// which represent individual data points, derived variables offer grouped
/// categories for more complex statistical analysis.
///
/// Derived variables enable users to:
/// - Access pre-aggregated variable groupings by region or category
/// - Query multi-variable calculations and transformations
/// - Analyze data across custom variable ranges
/// - Utilize standardized variable classifications
///
/// Each derived variable includes:
/// - A unique identifier for the derived calculation
/// - A display label describing the variable grouping
/// - Group classification metadata for organizing related variables
///
/// Derived variables work alongside base variables, periods, and vertical
/// variables to form the complete dimensional structure for dynamic table queries.
///
/// Example usage:
/// ```dart
/// // Get available derived variables for a specific variable
/// final derivedVariables = await stadata.list.derivedVariables(
///   domain: '0000',
///   variableID: 145,
/// );
///
/// // Use in dynamic table query for aggregated data
/// final data = await stadata.view.dynamicTableData(
///   domain: '0000',
///   variableID: 145,
///   derivedVariableID: derivedVariables.data.first.id,
/// );
/// ```
///
/// Documentation: https://webapi.bps.go.id/documentation/#dynamicdata_4
class DerivedVariable extends BaseEntity {
  /// Creates a new [DerivedVariable] instance.
  const DerivedVariable({
    required this.id,
    required this.name,
    required this.groupID,
    required this.groupName,
  });

  /// Unique identifier for the derived variable within BPS system
  ///
  /// This ID (turvar_id in API response) is used to reference the specific
  /// derived variable when querying dynamic table data with variable aggregations.
  final int id;

  /// Display label for this derived variable
  ///
  /// Human-readable name describing the variable grouping or calculation
  /// (e.g., regional groupings, categorical aggregations).
  final String name;

  /// Aggregation group identifier
  ///
  /// Numeric code linking this derived variable to its classification group,
  /// enabling systematic organization of related variable transformations.
  /// Can be null for variables without group classification.
  final int? groupID;

  /// Name of the classification group
  ///
  /// Human-readable label for the group category (e.g., "Wilayah Provinsi"
  /// indicating this belongs to the provincial area grouping category).
  /// Provides context for understanding the derived variable's scope.
  /// Can be null for variables without group classification.
  final String? groupName;

  @override
  List<Object?> get props => [
    id,
    name,
    groupID,
    groupName,
  ];
}
