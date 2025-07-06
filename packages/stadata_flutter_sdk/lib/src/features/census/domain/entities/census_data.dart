import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/census/census.dart';

/// Entity class representing census data from BPS Web API.
///
/// This class maps to the census data endpoint (id=41):
/// `https://webapi.bps.go.id/v1/api/interoperabilitas/datasource/sensus/id/41/`
///
/// Contains detailed census information with indicators, categories, and values.
class CensusData extends BaseEntity {
  /// Creates a new [CensusData] instance.
  const CensusData({
    required this.regionID,
    required this.regionCode,
    required this.regionName,
    required this.indicatorID,
    required this.indicatorName,
    required this.categories,
    required this.period,
    required this.value,
    this.regionLevel,
  });

  /// Region/area identifier
  final String regionID;

  /// Region/area code
  final String regionCode;

  /// Region/area name
  final String regionName;

  /// Region/area level (nullable)
  final String? regionLevel;

  /// Indicator identifier
  final String indicatorID;

  /// Indicator name/description
  final String indicatorName;

  /// List of categories that classify this census data
  /// Can contain 1-5 categories depending on the data
  final List<CensusCategory> categories;

  /// Data period/year
  final String period;

  /// The actual data value
  final num value;

  @override
  List<Object?> get props => [
    regionID,
    regionCode,
    regionName,
    regionLevel,
    indicatorID,
    indicatorName,
    categories,
    period,
    value,
  ];
}
