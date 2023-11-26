// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PublicationModel _$PublicationModelFromJson(Map<String, dynamic> json) {
  return _PublicationModel.fromJson(json);
}

/// @nodoc
mixin _$PublicationModel {
  @JsonKey(name: 'pub_id')
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get issn => throw _privateConstructorUsedError;
  String get cover => throw _privateConstructorUsedError;
  String get pdf => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'sch_date')
  DateTime? get scheduledDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'rl_date')
  DateTime? get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'updt_date')
  DateTime? get updateDate => throw _privateConstructorUsedError;
  String? get abstract => throw _privateConstructorUsedError;
  @JsonKey(name: 'kat_no')
  String? get catalogueNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'pub_no')
  String? get publicationNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicationModelCopyWith<PublicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicationModelCopyWith<$Res> {
  factory $PublicationModelCopyWith(
          PublicationModel value, $Res Function(PublicationModel) then) =
      _$PublicationModelCopyWithImpl<$Res, PublicationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pub_id') String id,
      String title,
      String issn,
      String cover,
      String pdf,
      String size,
      @JsonKey(name: 'sch_date') DateTime? scheduledDate,
      @JsonKey(name: 'rl_date') DateTime? releaseDate,
      @JsonKey(name: 'updt_date') DateTime? updateDate,
      String? abstract,
      @JsonKey(name: 'kat_no') String? catalogueNumber,
      @JsonKey(name: 'pub_no') String? publicationNumber});
}

/// @nodoc
class _$PublicationModelCopyWithImpl<$Res, $Val extends PublicationModel>
    implements $PublicationModelCopyWith<$Res> {
  _$PublicationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? issn = null,
    Object? cover = null,
    Object? pdf = null,
    Object? size = null,
    Object? scheduledDate = freezed,
    Object? releaseDate = freezed,
    Object? updateDate = freezed,
    Object? abstract = freezed,
    Object? catalogueNumber = freezed,
    Object? publicationNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      issn: null == issn
          ? _value.issn
          : issn // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      pdf: null == pdf
          ? _value.pdf
          : pdf // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledDate: freezed == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateDate: freezed == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      abstract: freezed == abstract
          ? _value.abstract
          : abstract // ignore: cast_nullable_to_non_nullable
              as String?,
      catalogueNumber: freezed == catalogueNumber
          ? _value.catalogueNumber
          : catalogueNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      publicationNumber: freezed == publicationNumber
          ? _value.publicationNumber
          : publicationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicationModelImplCopyWith<$Res>
    implements $PublicationModelCopyWith<$Res> {
  factory _$$PublicationModelImplCopyWith(_$PublicationModelImpl value,
          $Res Function(_$PublicationModelImpl) then) =
      __$$PublicationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pub_id') String id,
      String title,
      String issn,
      String cover,
      String pdf,
      String size,
      @JsonKey(name: 'sch_date') DateTime? scheduledDate,
      @JsonKey(name: 'rl_date') DateTime? releaseDate,
      @JsonKey(name: 'updt_date') DateTime? updateDate,
      String? abstract,
      @JsonKey(name: 'kat_no') String? catalogueNumber,
      @JsonKey(name: 'pub_no') String? publicationNumber});
}

/// @nodoc
class __$$PublicationModelImplCopyWithImpl<$Res>
    extends _$PublicationModelCopyWithImpl<$Res, _$PublicationModelImpl>
    implements _$$PublicationModelImplCopyWith<$Res> {
  __$$PublicationModelImplCopyWithImpl(_$PublicationModelImpl _value,
      $Res Function(_$PublicationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? issn = null,
    Object? cover = null,
    Object? pdf = null,
    Object? size = null,
    Object? scheduledDate = freezed,
    Object? releaseDate = freezed,
    Object? updateDate = freezed,
    Object? abstract = freezed,
    Object? catalogueNumber = freezed,
    Object? publicationNumber = freezed,
  }) {
    return _then(_$PublicationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      issn: null == issn
          ? _value.issn
          : issn // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      pdf: null == pdf
          ? _value.pdf
          : pdf // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledDate: freezed == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateDate: freezed == updateDate
          ? _value.updateDate
          : updateDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      abstract: freezed == abstract
          ? _value.abstract
          : abstract // ignore: cast_nullable_to_non_nullable
              as String?,
      catalogueNumber: freezed == catalogueNumber
          ? _value.catalogueNumber
          : catalogueNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      publicationNumber: freezed == publicationNumber
          ? _value.publicationNumber
          : publicationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicationModelImpl extends _PublicationModel {
  _$PublicationModelImpl(
      {@JsonKey(name: 'pub_id') required this.id,
      required this.title,
      required this.issn,
      required this.cover,
      required this.pdf,
      required this.size,
      @JsonKey(name: 'sch_date') this.scheduledDate,
      @JsonKey(name: 'rl_date') this.releaseDate,
      @JsonKey(name: 'updt_date') this.updateDate,
      this.abstract,
      @JsonKey(name: 'kat_no') this.catalogueNumber,
      @JsonKey(name: 'pub_no') this.publicationNumber})
      : super._();

  factory _$PublicationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicationModelImplFromJson(json);

  @override
  @JsonKey(name: 'pub_id')
  final String id;
  @override
  final String title;
  @override
  final String issn;
  @override
  final String cover;
  @override
  final String pdf;
  @override
  final String size;
  @override
  @JsonKey(name: 'sch_date')
  final DateTime? scheduledDate;
  @override
  @JsonKey(name: 'rl_date')
  final DateTime? releaseDate;
  @override
  @JsonKey(name: 'updt_date')
  final DateTime? updateDate;
  @override
  final String? abstract;
  @override
  @JsonKey(name: 'kat_no')
  final String? catalogueNumber;
  @override
  @JsonKey(name: 'pub_no')
  final String? publicationNumber;

  @override
  String toString() {
    return 'PublicationModel(id: $id, title: $title, issn: $issn, cover: $cover, pdf: $pdf, size: $size, scheduledDate: $scheduledDate, releaseDate: $releaseDate, updateDate: $updateDate, abstract: $abstract, catalogueNumber: $catalogueNumber, publicationNumber: $publicationNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.issn, issn) || other.issn == issn) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.pdf, pdf) || other.pdf == pdf) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.updateDate, updateDate) ||
                other.updateDate == updateDate) &&
            (identical(other.abstract, abstract) ||
                other.abstract == abstract) &&
            (identical(other.catalogueNumber, catalogueNumber) ||
                other.catalogueNumber == catalogueNumber) &&
            (identical(other.publicationNumber, publicationNumber) ||
                other.publicationNumber == publicationNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      issn,
      cover,
      pdf,
      size,
      scheduledDate,
      releaseDate,
      updateDate,
      abstract,
      catalogueNumber,
      publicationNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicationModelImplCopyWith<_$PublicationModelImpl> get copyWith =>
      __$$PublicationModelImplCopyWithImpl<_$PublicationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicationModelImplToJson(
      this,
    );
  }
}

abstract class _PublicationModel extends PublicationModel {
  factory _PublicationModel(
          {@JsonKey(name: 'pub_id') required final String id,
          required final String title,
          required final String issn,
          required final String cover,
          required final String pdf,
          required final String size,
          @JsonKey(name: 'sch_date') final DateTime? scheduledDate,
          @JsonKey(name: 'rl_date') final DateTime? releaseDate,
          @JsonKey(name: 'updt_date') final DateTime? updateDate,
          final String? abstract,
          @JsonKey(name: 'kat_no') final String? catalogueNumber,
          @JsonKey(name: 'pub_no') final String? publicationNumber}) =
      _$PublicationModelImpl;
  _PublicationModel._() : super._();

  factory _PublicationModel.fromJson(Map<String, dynamic> json) =
      _$PublicationModelImpl.fromJson;

  @override
  @JsonKey(name: 'pub_id')
  String get id;
  @override
  String get title;
  @override
  String get issn;
  @override
  String get cover;
  @override
  String get pdf;
  @override
  String get size;
  @override
  @JsonKey(name: 'sch_date')
  DateTime? get scheduledDate;
  @override
  @JsonKey(name: 'rl_date')
  DateTime? get releaseDate;
  @override
  @JsonKey(name: 'updt_date')
  DateTime? get updateDate;
  @override
  String? get abstract;
  @override
  @JsonKey(name: 'kat_no')
  String? get catalogueNumber;
  @override
  @JsonKey(name: 'pub_no')
  String? get publicationNumber;
  @override
  @JsonKey(ignore: true)
  _$$PublicationModelImplCopyWith<_$PublicationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
