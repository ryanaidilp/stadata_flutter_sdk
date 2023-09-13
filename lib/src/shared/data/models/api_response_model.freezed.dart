// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResponseModel<T> _$ApiResponseModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ApiResponseModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiResponseModel<T> {
  @ApiStatusSerializer()
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'data-availability')
  @DataAvailabilitySerializer()
  DataAvailability? get dataAvailability => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(readValue: _paginationValueReader)
  PaginationModel? get pagination => throw _privateConstructorUsedError;
  @JsonKey(readValue: _dataValueReader, name: 'data')
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseModelCopyWith<T, ApiResponseModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseModelCopyWith<T, $Res> {
  factory $ApiResponseModelCopyWith(
          ApiResponseModel<T> value, $Res Function(ApiResponseModel<T>) then) =
      _$ApiResponseModelCopyWithImpl<T, $Res, ApiResponseModel<T>>;
  @useResult
  $Res call(
      {@ApiStatusSerializer() bool status,
      @JsonKey(name: 'data-availability')
      @DataAvailabilitySerializer()
      DataAvailability? dataAvailability,
      String? message,
      @JsonKey(readValue: _paginationValueReader) PaginationModel? pagination,
      @JsonKey(readValue: _dataValueReader, name: 'data') T? data});

  $PaginationModelCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$ApiResponseModelCopyWithImpl<T, $Res, $Val extends ApiResponseModel<T>>
    implements $ApiResponseModelCopyWith<T, $Res> {
  _$ApiResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dataAvailability = freezed,
    Object? message = freezed,
    Object? pagination = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      dataAvailability: freezed == dataAvailability
          ? _value.dataAvailability
          : dataAvailability // ignore: cast_nullable_to_non_nullable
              as DataAvailability?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationModelCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationModelCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ApiResponseModelCopyWith<T, $Res>
    implements $ApiResponseModelCopyWith<T, $Res> {
  factory _$$_ApiResponseModelCopyWith(_$_ApiResponseModel<T> value,
          $Res Function(_$_ApiResponseModel<T>) then) =
      __$$_ApiResponseModelCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@ApiStatusSerializer() bool status,
      @JsonKey(name: 'data-availability')
      @DataAvailabilitySerializer()
      DataAvailability? dataAvailability,
      String? message,
      @JsonKey(readValue: _paginationValueReader) PaginationModel? pagination,
      @JsonKey(readValue: _dataValueReader, name: 'data') T? data});

  @override
  $PaginationModelCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$_ApiResponseModelCopyWithImpl<T, $Res>
    extends _$ApiResponseModelCopyWithImpl<T, $Res, _$_ApiResponseModel<T>>
    implements _$$_ApiResponseModelCopyWith<T, $Res> {
  __$$_ApiResponseModelCopyWithImpl(_$_ApiResponseModel<T> _value,
      $Res Function(_$_ApiResponseModel<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dataAvailability = freezed,
    Object? message = freezed,
    Object? pagination = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ApiResponseModel<T>(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      dataAvailability: freezed == dataAvailability
          ? _value.dataAvailability
          : dataAvailability // ignore: cast_nullable_to_non_nullable
              as DataAvailability?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_ApiResponseModel<T> implements _ApiResponseModel<T> {
  _$_ApiResponseModel(
      {@ApiStatusSerializer() required this.status,
      @JsonKey(name: 'data-availability')
      @DataAvailabilitySerializer()
      this.dataAvailability,
      this.message,
      @JsonKey(readValue: _paginationValueReader) this.pagination,
      @JsonKey(readValue: _dataValueReader, name: 'data') this.data});

  factory _$_ApiResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_ApiResponseModelFromJson(json, fromJsonT);

  @override
  @ApiStatusSerializer()
  final bool status;
  @override
  @JsonKey(name: 'data-availability')
  @DataAvailabilitySerializer()
  final DataAvailability? dataAvailability;
  @override
  final String? message;
  @override
  @JsonKey(readValue: _paginationValueReader)
  final PaginationModel? pagination;
  @override
  @JsonKey(readValue: _dataValueReader, name: 'data')
  final T? data;

  @override
  String toString() {
    return 'ApiResponseModel<$T>(status: $status, dataAvailability: $dataAvailability, message: $message, pagination: $pagination, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiResponseModel<T> &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dataAvailability, dataAvailability) ||
                other.dataAvailability == dataAvailability) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, dataAvailability,
      message, pagination, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiResponseModelCopyWith<T, _$_ApiResponseModel<T>> get copyWith =>
      __$$_ApiResponseModelCopyWithImpl<T, _$_ApiResponseModel<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_ApiResponseModelToJson<T>(this, toJsonT);
  }
}

abstract class _ApiResponseModel<T> implements ApiResponseModel<T> {
  factory _ApiResponseModel(
          {@ApiStatusSerializer() required final bool status,
          @JsonKey(name: 'data-availability')
          @DataAvailabilitySerializer()
          final DataAvailability? dataAvailability,
          final String? message,
          @JsonKey(readValue: _paginationValueReader)
          final PaginationModel? pagination,
          @JsonKey(readValue: _dataValueReader, name: 'data') final T? data}) =
      _$_ApiResponseModel<T>;

  factory _ApiResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_ApiResponseModel<T>.fromJson;

  @override
  @ApiStatusSerializer()
  bool get status;
  @override
  @JsonKey(name: 'data-availability')
  @DataAvailabilitySerializer()
  DataAvailability? get dataAvailability;
  @override
  String? get message;
  @override
  @JsonKey(readValue: _paginationValueReader)
  PaginationModel? get pagination;
  @override
  @JsonKey(readValue: _dataValueReader, name: 'data')
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ApiResponseModelCopyWith<T, _$_ApiResponseModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
