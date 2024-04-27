// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseModelImpl<T> _$$ApiResponseModelImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ApiResponseModelImpl<T>(
      status: const ApiStatusSerializer().fromJson(json['status'] as String),
      dataAvailability: _$JsonConverterFromJson<String, DataAvailability>(
          json['data-availability'],
          const DataAvailabilitySerializer().fromJson),
      message: json['message'] as String?,
      pagination: _paginationValueReader(json, 'pagination') == null
          ? null
          : PaginationModel.fromJson(_paginationValueReader(json, 'pagination')
              as Map<String, dynamic>),
      data:
          _$nullableGenericFromJson(_dataValueReader(json, 'data'), fromJsonT),
    );

Map<String, dynamic> _$$ApiResponseModelImplToJson<T>(
  _$ApiResponseModelImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': const ApiStatusSerializer().toJson(instance.status),
      'data-availability': _$JsonConverterToJson<String, DataAvailability>(
          instance.dataAvailability, const DataAvailabilitySerializer().toJson),
      'message': instance.message,
      'pagination': instance.pagination,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
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
