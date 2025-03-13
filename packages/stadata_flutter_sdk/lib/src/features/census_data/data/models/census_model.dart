import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'id';
const _nameKey = 'kegiatan';
const _yearKey = 'tahun_kegiatan';

class CensusModel extends Census {
  const CensusModel({
    required super.id,
    required super.name,
    required super.year,
  });

  CensusModel copyWith({String? id, String? name, int? year}) => CensusModel(
    id: id ?? this.id,
    name: name ?? this.name,
    year: year ?? this.year,
  );

  CensusModel.fromJson(JSON json)
    : super(
        id: json[_idKey] as String,
        name: json[_nameKey] as String,
        year: json[_yearKey] as int,
      );

  JSON toJson() => {_idKey: id, _nameKey: name, _yearKey: year};

  CensusModel.fromEntity(Census entity)
    : super(id: entity.id, name: entity.name, year: entity.year);
}
