// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/pagination_model.dart';
import 'package:stadata_flutter_sdk/src/shared/data/serializers/api_status_serializer.dart';
import 'package:stadata_flutter_sdk/src/shared/data/serializers/data_availability_serializer.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_availability.dart';

part 'api_response_model.freezed.dart';
part 'api_response_model.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponseModel<T> with _$ApiResponseModel<T> {
  factory ApiResponseModel({
    @ApiStatusSerializer() required bool status,
    @JsonKey(name: 'data-availability')
    @DataAvailabilitySerializer()
    DataAvailability? dataAvailability,
    String? message,
    @JsonKey(
      readValue: _paginationValueReader,
    )
    PaginationModel? pagination,
    @JsonKey(readValue: _dataValueReader, name: 'data') T? data,
  }) = _ApiResponseModel;

  factory ApiResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJson,
  ) =>
      _$ApiResponseModelFromJson(
        json,
        fromJson,
      );
}

extension ApiResponseModelX<T> on ApiResponseModel<T> {
  ApiResponse<Type> toEntitity<Type>() => ApiResponse<Type>(
        status: status,
        dataAvailability: dataAvailability,
        message: message,
        pagination: pagination?.toEntity(),
        data: data as Type,
      );
}

Object? _dataValueReader(Map<dynamic, dynamic> json, String key) {
  if (json[key] is List) {
    final object = json[key] as List;
    return object[1];
  }

  if (json[key] is Map) {
    return json[key];
  }

  return null;
}

Object? _paginationValueReader(Map<dynamic, dynamic> json, String key) {
  if (json[key] is List) {
    final object = json[key] as List;
    return object[0];
  }

  return null;
}
