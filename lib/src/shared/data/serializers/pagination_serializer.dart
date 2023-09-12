// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';

import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';

class PaginationSerializer extends JsonConverter<PaginationModel?, dynamic> {
  const PaginationSerializer();

  @override
  PaginationModel? fromJson(dynamic json) {
    if (json is List) {
      final data = json;
      return PaginationModel.fromJson(data[0] as JSON);
    }

    return null;
  }

  @override
  dynamic toJson(PaginationModel? object) =>
      object?.toJson();
}
