// ignore_for_file: public_member_api_docs
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'domain_id';
const _nameKey = 'domain_name';
const _urlKey = 'domain_url';

class DomainModel extends DomainEntity {
  const DomainModel({
    required super.id,
    required super.name,
    required super.url,
  });

  DomainModel copyWith({
    String? id,
    String? name,
    String? url,
  }) =>
      DomainModel(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory DomainModel.fromJson(JSON json) => DomainModel(
        id: json[_idKey] as String,
        name: json[_nameKey] as String,
        url: json[_urlKey] as String,
      );

  factory DomainModel.fromEntity(DomainEntity entity) => DomainModel(
        id: entity.id,
        name: entity.name,
        url: entity.url,
      );

  JSON toJson() => {
        _idKey: id,
        _nameKey: name,
        _urlKey: url,
      };
}
