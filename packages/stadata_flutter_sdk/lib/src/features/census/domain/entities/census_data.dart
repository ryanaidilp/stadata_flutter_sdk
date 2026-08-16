import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/census/census.dart';

/// Entity class representing census data from BPS Web API.
///
/// This class maps to the census data endpoint (id=41):
/// `https://webapi.bps.go.id/v1/api/interoperabilitas/datasource/sensus/id/41/`
///
/// Contains detailed census information with indicators, categories, and values.
class const CensusData({
  /// Region/area identifier
  required final String regionID,

  /// Region/area code
  required final String regionCode,

  /// Region/area name
  required final String regionName,

  /// Indicator identifier
  required final String indicatorID,

  /// Indicator name/description
  required final String indicatorName,

  /// List of categories that classify this census data
  /// Can contain 1-5 categories depending on the data
  required final List<CensusCategory> categories,

  /// Data period/year
  required final String period,

  /// The actual data value
  required final num value,

  /// Region/area level (nullable)
  final String? regionLevel,
}) extends BaseEntity {
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
