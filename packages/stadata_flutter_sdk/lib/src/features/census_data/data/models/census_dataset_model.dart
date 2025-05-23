import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'id';
const _topicIdKey = 'id_topik';
const _topicKey = 'topik';
const _eventIdKey = 'id_kegiatan';
const _nameKey = 'nama';
const _descriptionKey = 'deskripsi';

class CensusDatasetModel extends CensusDataset {
  const CensusDatasetModel({
    required super.id,
    required super.idTopic,
    required super.topic,
    required super.eventID,
    required super.name,
    super.description,
  });

  CensusDataset copyWith({
    int? id,
    int? idTopic,
    String? topic,
    int? eventID,
    String? name,
    String? description,
  }) => CensusDataset(
    id: id ?? this.id,
    idTopic: idTopic ?? this.idTopic,
    topic: topic ?? this.topic,
    eventID: eventID ?? this.eventID,
    name: name ?? this.name,
    description: description ?? this.description,
  );

  CensusDatasetModel.fromJson(JSON json)
    : super(
        id: json[_idKey] as int,
        idTopic: json[_topicIdKey] as int,
        topic: json[_topicKey] as String,
        eventID: json[_eventIdKey] as int,
        name: json[_nameKey] as String,
        description: json[_descriptionKey] as String?,
      );

  JSON toJson() => {
    _idKey: id,
    _topicIdKey: idTopic,
    _topicKey: topic,
    _eventIdKey: eventID,
    _nameKey: name,
    _descriptionKey: description,
  };

  CensusDatasetModel.fromEntity(CensusDataset entity)
    : super(
        id: entity.id,
        idTopic: entity.idTopic,
        topic: entity.topic,
        eventID: entity.eventID,
        name: entity.name,
        description: entity.description,
      );
}
