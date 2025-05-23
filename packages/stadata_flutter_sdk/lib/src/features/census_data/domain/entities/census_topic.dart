import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Represents a census topic/subject from BPS Web API.
///
/// This class maps to the census topics endpoint:
/// `https://webapi.bps.go.id/v1/api/interoperabilitas/datasource/sensus/id/38`
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
///
/// This endpoint is part of the BPS Web API Census Data service that provides
/// information about specific topics or subjects covered in a census event.
/// The response includes both Indonesian (topik) and English (topic) versions
/// of the topic name.
class CensusTopic extends BaseEntity {
  /// Creates a new [CensusTopic] instance.
  ///
  /// Parameters:
  /// - [id]: Unique identifier for the census topic
  /// - [topic]: Name/description of the census topic
  ///   (e.g. "Number and Distribution of Population")
  /// - [eventID]: ID of the census event this topic belongs to (e.g. "sp2022")
  /// - [eventName]: Name of the census event (e.g. "Long Form Sensus Penduduk 2020")
  const CensusTopic({
    required this.id,
    required this.topic,
    required this.eventID,
    required this.eventName,
  });

  /// Unique identifier for the census topic
  final int id;

  /// Name/description of the census topic in English
  final String topic;

  /// ID of the census event this topic belongs to (e.g. "sp2022")
  final String eventID;

  /// Full name of the census event
  final String eventName;

  @override
  List<Object?> get props => [id, topic, eventID, eventName];
}
