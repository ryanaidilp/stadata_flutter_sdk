import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing thematic topics within census events from BPS Web API.
///
/// This class maps to the census topics endpoint:
/// `https://webapi.bps.go.id/v1/api/interoperabilitas/datasource/sensus/id/38`
///
/// Census topics represent specific subject areas or themes covered within
/// a larger census event. They organize census data into logical categories
/// that correspond to different aspects of demographic, social, and economic
/// characteristics collected during the census.
///
/// Common census topics include:
/// - Population characteristics (jumlah dan distribusi penduduk)
/// - Housing conditions (kondisi perumahan)
/// - Educational attainment (tingkat pendidikan)
/// - Employment and labor force (ketenagakerjaan)
/// - Migration patterns (migrasi)
/// - Fertility and mortality (fertilitas dan mortalitas)
/// - Disability status (penyandang disabilitas)
/// - Economic activities (kegiatan ekonomi)
///
/// Each topic provides a structured way to access related datasets and
/// enables researchers to focus on specific demographic or socioeconomic
/// dimensions of the census data.
///
/// Example response from API:
/// ```json
/// {
///   "id": 16,
///   "topik": "Jumlah dan Distribusi Penduduk",
///   "topic": "Number and Distribution of Population",
///   "id_kegiatan": "sp2022",
///   "kegiatan": "Long Form Sensus Penduduk 2020",
///   "event": null,
///   "alias_kegiatan": "sp2022",
///   "alias_event": "sp2022"
/// }
/// ```
class CensusTopic extends BaseEntity {
  /// Creates a new [CensusTopic] instance.
  const CensusTopic({
    required this.id,
    required this.topic,
    required this.eventID,
    required this.eventName,
  });

  /// Unique numerical identifier for the census topic within BPS system
  final int id;

  /// Descriptive name of the census topic in English
  ///
  /// Standardized English terminology for the thematic area covered by this topic.
  /// Examples: "Number and Distribution of Population", "Housing Characteristics",
  /// "Educational Attainment", "Labor Force Participation", "Migration Status"
  final String topic;

  /// Identifier of the parent census event that contains this topic
  ///
  /// Links this topic to its corresponding census event using standardized
  /// BPS event codes. Examples: "sp2020", "se2016", "st2013"
  final String eventID;

  /// Full official name of the census event in Indonesian
  ///
  /// Complete title of the census activity as published by BPS.
  /// Examples: "Sensus Penduduk 2020", "Long Form Sensus Penduduk 2020",
  /// "Sensus Ekonomi 2016"
  final String eventName;

  @override
  List<Object?> get props => [id, topic, eventID, eventName];
}
