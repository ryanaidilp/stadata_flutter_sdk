// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'press_release_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PressReleaseModel _$PressReleaseModelFromJson(Map<String, dynamic> json) {
  return _PressReleaseModel.fromJson(json);
}

/// @nodoc
mixin _$PressReleaseModel {
  @JsonKey(name: 'brs_id')
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'rl_date')
  DateTime get releaseDate => throw _privateConstructorUsedError;
  String get pdf => throw _privateConstructorUsedError;
  String get slide => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail')
  String get cover => throw _privateConstructorUsedError;
  @AbstractSerializer()
  String? get abstract => throw _privateConstructorUsedError;
  @JsonKey(name: 'subj', readValue: _subjectValueReader)
  SubjectModel? get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'updt_date')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PressReleaseModelCopyWith<PressReleaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PressReleaseModelCopyWith<$Res> {
  factory $PressReleaseModelCopyWith(
          PressReleaseModel value, $Res Function(PressReleaseModel) then) =
      _$PressReleaseModelCopyWithImpl<$Res, PressReleaseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'brs_id') int id,
      String title,
      @JsonKey(name: 'rl_date') DateTime releaseDate,
      String pdf,
      String slide,
      String size,
      @JsonKey(name: 'thumbnail') String cover,
      @AbstractSerializer() String? abstract,
      @JsonKey(name: 'subj', readValue: _subjectValueReader)
      SubjectModel? subject,
      @JsonKey(name: 'updt_date') DateTime? updatedAt});

  $SubjectModelCopyWith<$Res>? get subject;
}

/// @nodoc
class _$PressReleaseModelCopyWithImpl<$Res, $Val extends PressReleaseModel>
    implements $PressReleaseModelCopyWith<$Res> {
  _$PressReleaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? releaseDate = null,
    Object? pdf = null,
    Object? slide = null,
    Object? size = null,
    Object? cover = null,
    Object? abstract = freezed,
    Object? subject = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pdf: null == pdf
          ? _value.pdf
          : pdf // ignore: cast_nullable_to_non_nullable
              as String,
      slide: null == slide
          ? _value.slide
          : slide // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      abstract: freezed == abstract
          ? _value.abstract
          : abstract // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectModel?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubjectModelCopyWith<$Res>? get subject {
    if (_value.subject == null) {
      return null;
    }

    return $SubjectModelCopyWith<$Res>(_value.subject!, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PressReleaseModelImplCopyWith<$Res>
    implements $PressReleaseModelCopyWith<$Res> {
  factory _$$PressReleaseModelImplCopyWith(_$PressReleaseModelImpl value,
          $Res Function(_$PressReleaseModelImpl) then) =
      __$$PressReleaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'brs_id') int id,
      String title,
      @JsonKey(name: 'rl_date') DateTime releaseDate,
      String pdf,
      String slide,
      String size,
      @JsonKey(name: 'thumbnail') String cover,
      @AbstractSerializer() String? abstract,
      @JsonKey(name: 'subj', readValue: _subjectValueReader)
      SubjectModel? subject,
      @JsonKey(name: 'updt_date') DateTime? updatedAt});

  @override
  $SubjectModelCopyWith<$Res>? get subject;
}

/// @nodoc
class __$$PressReleaseModelImplCopyWithImpl<$Res>
    extends _$PressReleaseModelCopyWithImpl<$Res, _$PressReleaseModelImpl>
    implements _$$PressReleaseModelImplCopyWith<$Res> {
  __$$PressReleaseModelImplCopyWithImpl(_$PressReleaseModelImpl _value,
      $Res Function(_$PressReleaseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? releaseDate = null,
    Object? pdf = null,
    Object? slide = null,
    Object? size = null,
    Object? cover = null,
    Object? abstract = freezed,
    Object? subject = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PressReleaseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      pdf: null == pdf
          ? _value.pdf
          : pdf // ignore: cast_nullable_to_non_nullable
              as String,
      slide: null == slide
          ? _value.slide
          : slide // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      abstract: freezed == abstract
          ? _value.abstract
          : abstract // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectModel?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PressReleaseModelImpl implements _PressReleaseModel {
  _$PressReleaseModelImpl(
      {@JsonKey(name: 'brs_id') required this.id,
      required this.title,
      @JsonKey(name: 'rl_date') required this.releaseDate,
      required this.pdf,
      required this.slide,
      required this.size,
      @JsonKey(name: 'thumbnail') required this.cover,
      @AbstractSerializer() this.abstract,
      @JsonKey(name: 'subj', readValue: _subjectValueReader) this.subject,
      @JsonKey(name: 'updt_date') this.updatedAt});

  factory _$PressReleaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PressReleaseModelImplFromJson(json);

  @override
  @JsonKey(name: 'brs_id')
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'rl_date')
  final DateTime releaseDate;
  @override
  final String pdf;
  @override
  final String slide;
  @override
  final String size;
  @override
  @JsonKey(name: 'thumbnail')
  final String cover;
  @override
  @AbstractSerializer()
  final String? abstract;
  @override
  @JsonKey(name: 'subj', readValue: _subjectValueReader)
  final SubjectModel? subject;
  @override
  @JsonKey(name: 'updt_date')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PressReleaseModel(id: $id, title: $title, releaseDate: $releaseDate, pdf: $pdf, slide: $slide, size: $size, cover: $cover, abstract: $abstract, subject: $subject, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PressReleaseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.pdf, pdf) || other.pdf == pdf) &&
            (identical(other.slide, slide) || other.slide == slide) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.abstract, abstract) ||
                other.abstract == abstract) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, releaseDate, pdf,
      slide, size, cover, abstract, subject, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PressReleaseModelImplCopyWith<_$PressReleaseModelImpl> get copyWith =>
      __$$PressReleaseModelImplCopyWithImpl<_$PressReleaseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PressReleaseModelImplToJson(
      this,
    );
  }
}

abstract class _PressReleaseModel implements PressReleaseModel {
  factory _PressReleaseModel(
          {@JsonKey(name: 'brs_id') required final int id,
          required final String title,
          @JsonKey(name: 'rl_date') required final DateTime releaseDate,
          required final String pdf,
          required final String slide,
          required final String size,
          @JsonKey(name: 'thumbnail') required final String cover,
          @AbstractSerializer() final String? abstract,
          @JsonKey(name: 'subj', readValue: _subjectValueReader)
          final SubjectModel? subject,
          @JsonKey(name: 'updt_date') final DateTime? updatedAt}) =
      _$PressReleaseModelImpl;

  factory _PressReleaseModel.fromJson(Map<String, dynamic> json) =
      _$PressReleaseModelImpl.fromJson;

  @override
  @JsonKey(name: 'brs_id')
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'rl_date')
  DateTime get releaseDate;
  @override
  String get pdf;
  @override
  String get slide;
  @override
  String get size;
  @override
  @JsonKey(name: 'thumbnail')
  String get cover;
  @override
  @AbstractSerializer()
  String? get abstract;
  @override
  @JsonKey(name: 'subj', readValue: _subjectValueReader)
  SubjectModel? get subject;
  @override
  @JsonKey(name: 'updt_date')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PressReleaseModelImplCopyWith<_$PressReleaseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
