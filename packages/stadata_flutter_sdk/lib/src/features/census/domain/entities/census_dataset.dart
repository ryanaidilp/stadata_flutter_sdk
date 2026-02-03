import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing datasets within census event topics from BPS Web API.
///
/// This class maps to the census datasets endpoint:
/// `https://webapi.bps.go.id/v1/api/interoperabilitas/datasource/sensus/id/40/`
///
/// Contains information about specific datasets available for census events,
/// organized by topics such as population (penduduk), housing (perumahan),
/// agriculture (pertanian), or economic activities (kegiatan ekonomi).
class CensusDataset extends BaseEntity {
  /// Creates a new [CensusDataset] instance.
  const CensusDataset({
    required this.id,
    required this.topicID,
    required this.topic,
    required this.eventID,
    required this.name,
    this.description,
  });

  /// Unique identifier for the census dataset
  final int id;

  /// Identifier of the topic this dataset belongs to
  /// Links to the corresponding census topic
  final int topicID;

  /// Name of the topic category (e.g., "Population", "Housing", "Agriculture")
  final String topic;

  /// Identifier of the census event this dataset is part of
  /// Links to the corresponding census event
  final int eventID;

  /// Descriptive name of the dataset indicating what data it contains
  final String name;

  /// Optional detailed description providing more context about the dataset
  /// May include methodology, scope, or data collection notes
  final String? description;

  @override
  List<Object?> get props => [id, topicID, topic, eventID, name, description];
}
