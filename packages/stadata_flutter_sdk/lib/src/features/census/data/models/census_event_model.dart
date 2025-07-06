import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'id';
const _nameKey = 'kegiatan';
const _yearKey = 'tahun_kegiatan';

class CensusEventModel extends CensusEvent {
  const CensusEventModel({
    required super.id,
    required super.name,
    required super.year,
  });

  CensusEventModel copyWith({String? id, String? name, int? year}) =>
      CensusEventModel(
        id: id ?? this.id,
        name: name ?? this.name,
        year: year ?? this.year,
      );

  CensusEventModel.fromJson(JSON json)
    : super(
        id: json[_idKey] as String,
        name: json[_nameKey] as String,
        year: json[_yearKey] as int,
      );

  JSON toJson() => {_idKey: id, _nameKey: name, _yearKey: year};

  CensusEventModel.fromEntity(CensusEvent entity)
    : super(id: entity.id, name: entity.name, year: entity.year);
}
