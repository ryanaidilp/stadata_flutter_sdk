// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

part 'press_release_model.freezed.dart';
part 'press_release_model.g.dart';

@freezed
abstract class PressReleaseModel with _$PressReleaseModel {
  factory PressReleaseModel({
    @JsonKey(name: 'brs_id') required int id,
    required String title,
    @JsonKey(name: 'rl_date') required DateTime releaseDate,
    required String pdf,
    required String slide,
    required String size,
    @JsonKey(name: 'thumbnail') required String cover,
    @AbstractSerializer() String? abstract,
    @JsonKey(name: 'subj', readValue: _subjectValueReader)
    SubjectModel? subject,
    @JsonKey(name: 'updt_date') DateTime? updatedAt,
  }) = _PressReleaseModel;
  factory PressReleaseModel.fromJson(Map<String, dynamic> json) =>
      _$PressReleaseModelFromJson(json);
}

Object? _subjectValueReader(Map<dynamic, dynamic> json, String key) {
  if (json['subj'] == null || json['subj_id'] == null) {
    return null;
  }

  return SubjectModel(
    id: json['subj_id'] as int,
    name: json['subj'] as String,
  ).toJson();
}

extension PressReleaseModelX on PressReleaseModel {
  PressRelease toEntity() => PressRelease(
        id: id,
        subject: subject?.toEntity(),
        title: title,
        abstract: abstract,
        releaseDate: releaseDate,
        pdf: pdf,
        size: size,
        cover: cover,
        slide: slide,
      );
}
