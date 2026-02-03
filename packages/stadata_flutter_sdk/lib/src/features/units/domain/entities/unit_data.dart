import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing units of measurement from BPS Web API.
///
/// This class maps to the units endpoint:
/// `https://webapi.bps.go.id/v1/api/list/unit`
///
/// Units of measurement provide standardized quantitative scales and metrics
/// used across BPS statistical data collection, analysis, and reporting.
/// They ensure consistency, comparability, and proper interpretation of
/// numerical data across different statistical domains and time periods.
///
/// Units serve critical functions in statistical work:
/// - Provide standardized measurement scales for data collection
/// - Enable proper interpretation and comparison of numerical values
/// - Support aggregation and calculation of derived statistics
/// - Ensure international comparability of Indonesian statistics
/// - Facilitate accurate communication of statistical findings
///
/// Common units used in Indonesian statistics include:
/// - Rupiah (Currency) - Economic and financial indicators
/// - Orang (Persons) - Population and demographic counts
/// - Ton (Metric tons) - Agricultural and industrial production
/// - Persen (Percent) - Rates, ratios, and relative measures
/// - Hektar (Hectares) - Land area and agricultural coverage
/// - Kilogram (Kilograms) - Production weights and commodities
///
/// Each unit specification ensures that data users can correctly
/// interpret and apply statistical information in their analysis
/// and decision-making processes.
///
/// Documentation: https://webapi.bps.go.id/documentation/#dynamicdata_5
class UnitData extends BaseEntity {
  /// Creates a new [UnitData] instance.
  const UnitData({required this.id, required this.title});

  /// Unique identifier for the unit of measurement within BPS system
  ///
  /// Corresponds to 'unit_id' from the API response and provides
  /// systematic identification for units across statistical datasets.
  final int id;

  /// Descriptive name of the unit of measurement in Indonesian
  ///
  /// Maps to 'unit' in the API response and provides the standardized
  /// name for the measurement unit. Examples: "Rupiah", "Orang", "Ton",
  /// "Persen", "Hektar", "Kilogram", "Liter", "Meter Persegi"
  final String title;
  @override
  List<Object> get props => [id, title];
}
