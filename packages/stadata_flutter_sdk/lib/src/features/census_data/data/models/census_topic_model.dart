import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'id';
const _topicKey = 'topik';
const _eventNameKey = 'kegiatan';
const _eventIDKey = 'id_kegiatan';

class CensusTopicModel extends CensusTopic {
  const CensusTopicModel({
    required super.id,
    required super.topic,
    required super.eventID,
    required super.eventName,
  });

  CensusTopicModel copyWith({
    int? id,
    String? topic,
    String? eventID,
    String? eventName,
  }) => CensusTopicModel(
    id: id ?? this.id,
    topic: topic ?? this.topic,
    eventID: eventID ?? this.eventID,
    eventName: eventName ?? this.eventName,
  );

  CensusTopicModel.fromJson(JSON json)
    : super(
        id: json[_idKey] as int,
        topic: json[_topicKey] as String,
        eventID: json[_eventIDKey] as String,
        eventName: json[_eventNameKey] as String,
      );

  CensusTopicModel.fromEntity(CensusTopic entity)
    : super(
        id: entity.id,
        topic: entity.topic,
        eventID: entity.eventID,
        eventName: entity.eventName,
      );

  JSON toJson() => {
    _idKey: id,
    _topicKey: topic,
    _eventIDKey: eventID,
    _eventNameKey: eventName,
  };
}
