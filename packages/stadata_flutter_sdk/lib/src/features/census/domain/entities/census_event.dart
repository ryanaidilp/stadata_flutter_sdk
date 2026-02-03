import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing major census activities and events from BPS Web API.
///
/// This class maps to the census events endpoint:
/// `https://webapi.bps.go.id/v1/api/interoperabilitas/datasource/sensus/id/37/`
///
/// Census events represent major data collection activities conducted by BPS
/// on a periodic basis to gather comprehensive demographic, housing, economic,
/// and agricultural statistics across Indonesia. These large-scale surveys
/// provide foundational data for national planning and policy development.
///
/// Major census types include:
/// - Population Census (Sensus Penduduk) - conducted every 10 years
/// - Economic Census (Sensus Ekonomi) - business and economic activity data
/// - Agricultural Census (Sensus Pertanian) - farming and agricultural statistics
/// - Inter-census Population Survey (SUPAS) - mid-decade population updates
///
/// Each census event spans multiple years from planning through data collection
/// to final publication, with standardized methodologies ensuring data quality
/// and comparability across time periods.
///
/// Example response from API:
/// ```json
/// {
///   "id": "sp2020",
///   "kegiatan": "Sensus Penduduk 2020",
///   "tahun_kegiatan": 2020
/// }
/// ```
class CensusEvent extends BaseEntity {
  /// Creates a new [CensusEvent] instance.
  const CensusEvent({required this.id, required this.name, required this.year});

  /// Unique standardized identifier for the census activity
  ///
  /// Uses BPS coding conventions combining census type and year.
  /// Examples: "sp2020" (Sensus Penduduk 2020), "se2016" (Sensus Ekonomi 2016),
  /// "st2013" (Sensus Pertanian 2013), "supas2015" (Survei Penduduk Antar Sensus)
  final String id;

  /// Official name and description of the census activity
  ///
  /// Full Indonesian title of the census as published by BPS.
  /// Examples: "Sensus Penduduk 2020", "Sensus Ekonomi 2016",
  /// "Sensus Pertanian 2013", "Survei Penduduk Antar Sensus 2015"
  final String name;

  /// Reference year when the main data collection period occurred
  ///
  /// Represents the primary year of fieldwork and data gathering,
  /// though planning and analysis may span multiple years.
  /// Used for temporal organization and data series identification.
  final int year;

  @override
  List<Object?> get props => [id, name, year];
}
