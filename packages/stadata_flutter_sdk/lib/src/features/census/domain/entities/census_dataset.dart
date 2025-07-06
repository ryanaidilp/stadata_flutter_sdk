import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Represents a dataset within a census event topic
///
/// This entity contains information about specific datasets available
/// for a census event, organized by topics such as population,
/// housing, agriculture, or economic activities.
///
/// Reference: https://webapi.bps.go.id/documentation/#census
class CensusDataset extends BaseEntity {
  /// Creates a [CensusDataset] with the specified properties
  const CensusDataset({
    required this.id,
    required this.topicID,
    required this.topic,
    required this.eventID,
    required this.name,
    this.description,
  });

  /// Unique identifier for the dataset
  final int id;

  /// Identifier of the topic this dataset belongs to
  final int topicID;

  /// Name of the topic category (e.g., "Population", "Housing")
  final String topic;

  /// Identifier of the census event this dataset is part of
  final int eventID;

  /// Name of the dataset
  final String name;

  /// Optional description providing more details about the dataset
  final String? description;

  @override
  List<Object?> get props => [id, topicID, topic, eventID, name, description];
}
