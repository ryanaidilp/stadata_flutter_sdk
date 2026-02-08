// Model class overrides fields from base entity for API response serialization
// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

const _statusKey = 'status';
const _dataAvailabilityKey = 'data-availability';
const _messageKey = 'message';
const _dataKey = 'data';

/// Top-level function to parse ApiResponseModel in an isolate
///
/// This function is isolate-compatible and handles the BPS API nested structure.
/// Use this when parsing API responses in background isolates for performance.
///
/// Example:
/// ```dart
/// final result = await JsonParser.parse<ApiResponseModel<List<MyModel>>>(
///   jsonData,
///   (json) => parseApiResponseModelInIsolate<List<MyModel>>(
///     json,
///     (dataJson) => (dataJson as List).map((e) => MyModel.fromJson(e)).toList(),
///   ),
/// );
/// ```
ApiResponseModel<T> parseApiResponseModelInIsolate<T>(
  JSON json,
  T Function(Object? json) fromJson,
) {
  return ApiResponseModel<T>(
    status: const ApiStatusConverter().fromJson(json[_statusKey] as String),
    dataAvailability: const DataAvailabilityConverter().fromJson(
      json[_dataAvailabilityKey] as String,
    ),
    message: json[_messageKey] as String?,
    pagination:
        _paginationValueReader(json, _dataKey) == null
            ? null
            : PaginationModel.fromJson(
              _paginationValueReader(json, _dataKey)! as JSON,
            ),
    data: fromJson.call(_dataValueReader(json, _dataKey)),
  );
}

class ApiResponseModel<T> extends ApiResponse<T> {
  const ApiResponseModel({
    required super.status,
    super.dataAvailability,
    super.message,
    this.pagination,
    super.data,
  }) : super(pagination: pagination);

  @override
  final PaginationModel? pagination;

  factory ApiResponseModel.fromJson(
    JSON json,
    T Function(Object? json) fromJson,
  ) => ApiResponseModel(
    status: const ApiStatusConverter().fromJson(json[_statusKey] as String),
    dataAvailability: const DataAvailabilityConverter().fromJson(
      json[_dataAvailabilityKey] as String,
    ),
    message: json[_messageKey] as String?,
    pagination:
        _paginationValueReader(json, _dataKey) == null
            ? null
            : PaginationModel.fromJson(
              _paginationValueReader(json, _dataKey)! as JSON,
            ),
    data: fromJson.call(_dataValueReader(json, _dataKey)),
  );

  JSON toJson({required Object? Function(T value) toJson}) => {
    _statusKey: const ApiStatusConverter().toJson(status),
    _dataAvailabilityKey:
        dataAvailability == null
            ? null
            : const DataAvailabilityConverter().toJson(dataAvailability!),
    _messageKey: message,
    _dataKey: [
      pagination?.toJson(),
      _handleToJsonData(toJson: toJson, input: data),
    ],
  };

  Object? _handleToJsonData({
    required Object? Function(T value) toJson,
    T? input,
  }) => input == null ? null : toJson(input);

  ApiResponseModel<T> copyWith({
    ValueGetter<String?>? message,
    ValueGetter<DataAvailability?>? dataAvailability,
    bool? status,
    ValueGetter<T?>? data,
    ValueGetter<PaginationModel?>? pagination,
  }) => ApiResponseModel<T>(
    message: message != null ? message() : this.message,
    dataAvailability:
        dataAvailability != null ? dataAvailability() : this.dataAvailability,
    status: status ?? this.status,
    data: data != null ? data() : this.data,
    pagination: pagination != null ? pagination() : this.pagination,
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
