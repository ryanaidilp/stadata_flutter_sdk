// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/entities/publication.dart';

part 'publication_model.freezed.dart';
part 'publication_model.g.dart';

@freezed
class PublicationModel with _$PublicationModel {
  factory PublicationModel({
    @JsonKey(name: 'pub_id') required String id,
    required String title,
    required String issn,
    required String cover,
    required String pdf,
    required String size,
    @JsonKey(name: 'sch_date') DateTime? scheduledDate,
    @JsonKey(name: 'rl_date') DateTime? releaseDate,
    @JsonKey(name: 'updt_date') DateTime? updateDate,
    String? abstract,
    @JsonKey(name: 'kat_no') String? catalogueNumber,
    @JsonKey(name: 'pub_no') String? publicationNumber,
  }) = _PublicationModel;

  const PublicationModel._();
  factory PublicationModel.fromJson(Map<String, dynamic> json) =>
      _$PublicationModelFromJson(json);
  factory PublicationModel.fromEntity(Publication publication) =>
      PublicationModel(
        id: publication.id,
        title: publication.title,
        issn: publication.issn,
        cover: publication.cover,
        pdf: publication.pdf,
        size: publication.size,
        abstract: publication.abstract,
        catalogueNumber: publication.catalogueNumber,
        publicationNumber: publication.publicationNumber,
        releaseDate: publication.releaseDate,
        scheduledDate: publication.scheduledDate,
        updateDate: publication.updateDate,
      );
}

extension PublicationModelX on PublicationModel {
  Publication toEntity() => Publication(
        id: id,
        title: title,
        issn: issn,
        cover: cover,
        pdf: pdf,
        size: size,
        abstract: abstract,
        catalogueNumber: catalogueNumber,
        publicationNumber: publicationNumber,
        releaseDate: releaseDate,
        scheduledDate: scheduledDate,
        updateDate: updateDate,
      );
}
