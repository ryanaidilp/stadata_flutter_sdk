import 'package:stadata_flutter_sdk/src/core/core.dart';

class CensusDataset extends BaseEntity {
  const CensusDataset({
    required this.id,
    required this.idTopic,
    required this.topic,
    required this.eventID,
    required this.name,
    this.description,
  });

  final int id;
  final int idTopic;
  final String topic;
  final int eventID;
  final String name;
  final String? description;

  @override
  List<Object?> get props => [id, idTopic, topic, eventID, name, description];
}
