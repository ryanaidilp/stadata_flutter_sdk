// ignore_for_file: public_member_api_docs, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/pagination.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@freezed
class PaginationModel with _$PaginationModel {
  factory PaginationModel({
    @Default(0) int page,
    @Default(0) int pages,
    required int total,
    @JsonKey(name: 'per_page') int? perPage,
    int? count,
  }) = _PaginationModel;

  const PaginationModel._();
  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  factory PaginationModel.fromEntity(Pagination entity) => PaginationModel(
        page: entity.page,
        pages: entity.pages,
        total: entity.total,
        count: entity.count,
        perPage: entity.perPage,
      );
}

extension PaginationModelX on PaginationModel {
  Pagination toEntity() => Pagination(
        page: page,
        pages: pages,
        total: total,
        count: count,
        perPage: perPage,
      );
}
