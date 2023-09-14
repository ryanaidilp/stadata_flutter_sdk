// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiResponseModel<T> _$$_ApiResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_ApiResponseModel<T>(
      status: const ApiStatusSerializer().fromJson(json['status'] as String),
      dataAvailability: _$JsonConverterFromJson<String, DataAvailability>(
          json['data-availability'],
          const DataAvailabilitySerializer().fromJson),
      message: json['message'] as String?,
      pagination: _paginationValueReader(json, 'data') == null
          ? null
          : PaginationModel.fromJson(
              _paginationValueReader(json, 'data') as Map<String, dynamic>),
      data:
          _$nullableGenericFromJson(_dataValueReader(json, 'data'), fromJsonT),
    );

Map<String, dynamic> _$$_ApiResponseModelToJson<T>(
  _$_ApiResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': const ApiStatusSerializer().toJson(instance.status),
      'data-availability': _$JsonConverterToJson<String, DataAvailability>(
          instance.dataAvailability, const DataAvailabilitySerializer().toJson),
      'message': instance.message,
      'data': [
        instance.pagination,
        _$nullableGenericToJson(instance.data, toJsonT)
      ],
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
