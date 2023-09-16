// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/entities/infographic.dart';

part 'infographic_model.freezed.dart';
part 'infographic_model.g.dart';

@freezed
abstract class InfographicModel with _$InfographicModel {
  factory InfographicModel({
    @JsonKey(name: 'inf_id') required int id,
    required String title,
    @JsonKey(name: 'img') required String image,
    @JsonKey(name: 'desc') required String description,
    required int category,
    @JsonKey(name: 'dl') required String downloadUrl,
  }) = _InfographicModel;
  factory InfographicModel.fromJson(Map<String, dynamic> json) =>
      _$InfographicModelFromJson(json);
}

extension InfographicModelX on InfographicModel {
  Infographic toEntity() => Infographic(
        id: id,
        title: title,
        image: image,
        description: description,
        category: category,
        downloadUrl: downloadUrl,
      );
}
