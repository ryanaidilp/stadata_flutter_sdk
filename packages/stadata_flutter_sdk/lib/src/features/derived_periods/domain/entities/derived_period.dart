import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing derived/grouped time periods from BPS Web API.
///
/// This class maps to the derived periods endpoint:
/// `https://webapi.bps.go.id/v1/api/list?model=turth`
///
/// Derived periods (turth) represent calculated or transformed time periods—
/// aggregations or groupings across base periods. Unlike standard periods (th)
/// which represent individual years, derived periods offer grouped temporal
/// categories for more complex time-based analysis.
///
/// Derived periods enable users to:
/// - Access pre-aggregated temporal groupings (e.g., "Tahunan" for annual)
/// - Query multi-period calculations and transformations
/// - Analyze data across custom time ranges
/// - Utilize standardized temporal classifications
///
/// Each derived period includes:
/// - A unique identifier for the derived calculation
/// - A display label describing the temporal grouping
/// - Group classification metadata for organizing related periods
///
/// Derived periods work alongside base periods (th), variables, and vertical
/// variables to form the complete dimensional structure for dynamic table queries.
///
/// Example usage:
/// ```dart
/// // Get available derived periods for a variable
/// final derivedPeriods = await stadata.list.derivedPeriods(
///   domain: '0000',
///   variableID: 145,
/// );
///
/// // Use in dynamic table query for aggregated data
/// final data = await stadata.view.dynamicTableData(
///   domain: '0000',
///   variableID: 145,
///   derivedPeriodID: derivedPeriods.data.first.id,
/// );
/// ```
///
/// Documentation: https://webapi.bps.go.id/documentation/#dynamicdata_4
class DerivedPeriod extends BaseEntity {
  /// Creates a new [DerivedPeriod] instance.
  const DerivedPeriod({
    required this.id,
    required this.name,
    required this.groupID,
    required this.groupName,
  });

  /// Unique identifier for the derived period within BPS system
  ///
  /// This ID (turth_id in API response) is used to reference the specific
  /// derived period when querying dynamic table data with temporal aggregations.
  final int id;

  /// Display label for this derived period
  ///
  /// Human-readable name describing the temporal grouping or calculation
  /// (e.g., "Tahunan" for annual aggregations, "Triwulanan" for quarterly).
  final String name;

  /// Aggregation group identifier
  ///
  /// Numeric code linking this derived period to its classification group,
  /// enabling systematic organization of related temporal transformations.
  final int groupID;

  /// Name of the classification group
  ///
  /// Human-readable label for the group category (e.g., "Tahunan" indicating
  /// this belongs to the annual grouping category). Provides context for
  /// understanding the derived period's temporal scope.
  final String groupName;

  @override
  List<Object?> get props => [
    id,
    name,
    groupID,
    groupName,
  ];
}
