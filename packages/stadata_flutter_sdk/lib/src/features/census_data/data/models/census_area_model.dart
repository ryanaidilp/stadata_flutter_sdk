import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'id';
const _nameKey = 'nama';
const _slugKey = 'slug';
const _mfdCodeKey = 'kode_mfd';

class CensusAreaModel extends CensusArea {
  const CensusAreaModel({
    required super.id,
    required super.mfdCode,
    required super.name,
    required super.slug,
  });

  factory CensusAreaModel.fromEntity(CensusArea entity) => CensusAreaModel(
    id: entity.id,
    name: entity.name,
    slug: entity.slug,
    mfdCode: entity.mfdCode,
  );

  CensusArea toEntity() =>
      CensusArea(id: id, mfdCode: mfdCode, name: name, slug: slug);

  factory CensusAreaModel.fromJson(JSON json) => CensusAreaModel(
    id: json[_idKey] as int,
    name: json[_nameKey] as String,
    slug: json[_slugKey] as String,
    mfdCode: json[_mfdCodeKey] as String,
  );

  JSON toJson() => {
    _idKey: id,
    _nameKey: name,
    _slugKey: slug,
    _mfdCodeKey: mfdCode,
  };
}
