// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

part 'domain_model.freezed.dart';
part 'domain_model.g.dart';

@freezed
class DomainModel with _$DomainModel {
  const factory DomainModel({
    @JsonKey(name: 'domain_id') required String id,
    @JsonKey(name: 'domain_name') required String name,
    @JsonKey(name: 'domain_url') required String url,
  }) = _DomainModel;
  const DomainModel._();
  factory DomainModel.fromJson(Map<String, dynamic> json) =>
      _$DomainModelFromJson(json);
  factory DomainModel.fromEntity(DomainEntity entity) => DomainModel(
        id: entity.id,
        name: entity.name,
        url: entity.url,
      );
}

extension DomainModelX on DomainModel {
  DomainEntity toEntity() => DomainEntity(
        id: id,
        name: name,
        url: url,
      );
}
