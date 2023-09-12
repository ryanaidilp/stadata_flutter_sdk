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
      dataAvailability: const DataAvailabilitySerializer()
          .fromJson(json['data-availability'] as String),
      message: json['message'] as String?,
      pagination: const PaginationSerializer().fromJson(json['data']),
      data: _$nullableGenericFromJson(json['data'][1], fromJsonT),
    );

Map<String, dynamic> _$$_ApiResponseModelToJson<T>(
  _$_ApiResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': const ApiStatusSerializer().toJson(instance.status),
      'data-availability':
          const DataAvailabilitySerializer().toJson(instance.dataAvailability),
      'message': instance.message,
      'data': [
        const PaginationSerializer().toJson(instance.pagination),
        _$nullableGenericToJson(instance.data, toJsonT),
      ],
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
