import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing time periods from BPS Web API.
///
/// This class maps to the periods endpoint:
/// `https://webapi.bps.go.id/v1/api/list?model=th`
///
/// Time periods (th) represent specific temporal points or ranges for which
/// statistical data is available. These are fundamental building blocks for
/// querying dynamic tables, enabling time-series analysis and temporal filtering.
///
/// Periods enable users to:
/// - Discover available years/timeframes for specific variables
/// - Filter dynamic table data by temporal dimensions
/// - Construct time-series queries for statistical analysis
/// - Access historical data across different time points
///
/// Each period typically represents a calendar year, though the BPS system
/// may support other temporal granularities (quarters, months) depending on
/// the statistical variable and data collection methodology.
///
/// Periods work in conjunction with Variables and Vertical Variables to form
/// the complete dimensional structure needed for dynamic table queries.
///
/// Example usage:
/// ```dart
/// // Get available periods for a variable
/// final periods = await stadata.list.periods(
///   domain: '0000',
///   variableID: 145,
/// );
///
/// // Use period in dynamic table query
/// final data = await stadata.view.dynamicTableData(
///   domain: '0000',
///   variableID: 145,
///   period: '${periods.data.first.id}',
/// );
/// ```
///
/// Documentation: https://webapi.bps.go.id/documentation/#dynamicdata_4
class Period extends BaseEntity {
  /// Creates a new [Period] instance.
  const Period({
    required this.id,
    required this.year,
  });

  /// Unique identifier for the time period within BPS system
  ///
  /// This ID (th_id in API response) is used to reference the specific
  /// period when querying dynamic table data. The ID is system-generated
  /// and may not directly correspond to the year value.
  final int id;

  /// The year value for this period
  ///
  /// Represents the actual calendar year (e.g., 2017, 2016, 2015) for which
  /// statistical data is available. This is the human-readable temporal
  /// reference displayed to users.
  ///
  /// Note: While typically representing full calendar years, some statistical
  /// series may use fiscal years or other temporal conventions. Refer to the
  /// variable metadata for specific temporal definitions.
  final int year;

  @override
  List<Object?> get props => [
    id,
    year,
  ];
}
