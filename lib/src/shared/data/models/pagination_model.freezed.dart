// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) {
  return _PaginationModel.fromJson(json);
}

/// @nodoc
mixin _$PaginationModel {
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationModelCopyWith<PaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationModelCopyWith<$Res> {
  factory $PaginationModelCopyWith(
          PaginationModel value, $Res Function(PaginationModel) then) =
      _$PaginationModelCopyWithImpl<$Res, PaginationModel>;
  @useResult
  $Res call(
      {int page,
      int pages,
      int total,
      @JsonKey(name: 'per_page') int? perPage,
      int? count});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<$Res, $Val extends PaginationModel>
    implements $PaginationModelCopyWith<$Res> {
  _$PaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pages = null,
    Object? total = null,
    Object? perPage = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationModelCopyWith<$Res>
    implements $PaginationModelCopyWith<$Res> {
  factory _$$_PaginationModelCopyWith(
          _$_PaginationModel value, $Res Function(_$_PaginationModel) then) =
      __$$_PaginationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      int pages,
      int total,
      @JsonKey(name: 'per_page') int? perPage,
      int? count});
}

/// @nodoc
class __$$_PaginationModelCopyWithImpl<$Res>
    extends _$PaginationModelCopyWithImpl<$Res, _$_PaginationModel>
    implements _$$_PaginationModelCopyWith<$Res> {
  __$$_PaginationModelCopyWithImpl(
      _$_PaginationModel _value, $Res Function(_$_PaginationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pages = null,
    Object? total = null,
    Object? perPage = freezed,
    Object? count = freezed,
  }) {
    return _then(_$_PaginationModel(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaginationModel extends _PaginationModel {
  _$_PaginationModel(
      {required this.page,
      required this.pages,
      required this.total,
      @JsonKey(name: 'per_page') this.perPage,
      this.count})
      : super._();

  factory _$_PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationModelFromJson(json);

  @override
  final int page;
  @override
  final int pages;
  @override
  final int total;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  final int? count;

  @override
  String toString() {
    return 'PaginationModel(page: $page, pages: $pages, total: $total, perPage: $perPage, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationModel &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, pages, total, perPage, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationModelCopyWith<_$_PaginationModel> get copyWith =>
      __$$_PaginationModelCopyWithImpl<_$_PaginationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationModelToJson(
      this,
    );
  }
}

abstract class _PaginationModel extends PaginationModel {
  factory _PaginationModel(
      {required final int page,
      required final int pages,
      required final int total,
      @JsonKey(name: 'per_page') final int? perPage,
      final int? count}) = _$_PaginationModel;
  _PaginationModel._() : super._();

  factory _PaginationModel.fromJson(Map<String, dynamic> json) =
      _$_PaginationModel.fromJson;

  @override
  int get page;
  @override
  int get pages;
  @override
  int get total;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationModelCopyWith<_$_PaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
