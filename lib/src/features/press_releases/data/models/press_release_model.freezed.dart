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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PressReleaseModel _$PressReleaseModelFromJson(Map<String, dynamic> json) {
  return _PressReleaseModel.fromJson(json);
}

/// @nodoc
mixin _$PressReleaseModel {
  @JsonKey(name: 'brs_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'subj', readValue: _subjectValueReader)
  SubjectModel? get subject => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @AbstractSerializer()
  String get abstract => throw _privateConstructorUsedError;
  @JsonKey(name: 'rl_date')
  DateTime get releaseDate => throw _privateConstructorUsedError;
  String get pdf => throw _privateConstructorUsedError;
  String get slide => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail')
  String get cover => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'subj', readValue: _subjectValueReader)
      SubjectModel? subject,
      String title,
      @AbstractSerializer() String abstract,
      @JsonKey(name: 'rl_date') DateTime releaseDate,
      String pdf,
      String slide,
      String size,
      @JsonKey(name: 'thumbnail') String cover,
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
    Object? subject = freezed,
    Object? title = null,
    Object? abstract = null,
    Object? releaseDate = null,
    Object? pdf = null,
    Object? slide = null,
    Object? size = null,
    Object? cover = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectModel?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      abstract: null == abstract
          ? _value.abstract
          : abstract // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_PressReleaseModelCopyWith<$Res>
    implements $PressReleaseModelCopyWith<$Res> {
  factory _$$_PressReleaseModelCopyWith(_$_PressReleaseModel value,
          $Res Function(_$_PressReleaseModel) then) =
      __$$_PressReleaseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'brs_id') int id,
      @JsonKey(name: 'subj', readValue: _subjectValueReader)
      SubjectModel? subject,
      String title,
      @AbstractSerializer() String abstract,
      @JsonKey(name: 'rl_date') DateTime releaseDate,
      String pdf,
      String slide,
      String size,
      @JsonKey(name: 'thumbnail') String cover,
      @JsonKey(name: 'updt_date') DateTime? updatedAt});

  @override
  $SubjectModelCopyWith<$Res>? get subject;
}

/// @nodoc
class __$$_PressReleaseModelCopyWithImpl<$Res>
    extends _$PressReleaseModelCopyWithImpl<$Res, _$_PressReleaseModel>
    implements _$$_PressReleaseModelCopyWith<$Res> {
  __$$_PressReleaseModelCopyWithImpl(
      _$_PressReleaseModel _value, $Res Function(_$_PressReleaseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subject = freezed,
    Object? title = null,
    Object? abstract = null,
    Object? releaseDate = null,
    Object? pdf = null,
    Object? slide = null,
    Object? size = null,
    Object? cover = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_PressReleaseModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectModel?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      abstract: null == abstract
          ? _value.abstract
          : abstract // ignore: cast_nullable_to_non_nullable
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
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PressReleaseModel implements _PressReleaseModel {
  _$_PressReleaseModel(
      {@JsonKey(name: 'brs_id') required this.id,
      @JsonKey(name: 'subj', readValue: _subjectValueReader) this.subject,
      required this.title,
      @AbstractSerializer() required this.abstract,
      @JsonKey(name: 'rl_date') required this.releaseDate,
      required this.pdf,
      required this.slide,
      required this.size,
      @JsonKey(name: 'thumbnail') required this.cover,
      @JsonKey(name: 'updt_date') this.updatedAt});

  factory _$_PressReleaseModel.fromJson(Map<String, dynamic> json) =>
      _$$_PressReleaseModelFromJson(json);

  @override
  @JsonKey(name: 'brs_id')
  final int id;
  @override
  @JsonKey(name: 'subj', readValue: _subjectValueReader)
  final SubjectModel? subject;
  @override
  final String title;
  @override
  @AbstractSerializer()
  final String abstract;
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
  @JsonKey(name: 'updt_date')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PressReleaseModel(id: $id, subject: $subject, title: $title, abstract: $abstract, releaseDate: $releaseDate, pdf: $pdf, slide: $slide, size: $size, cover: $cover, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PressReleaseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.abstract, abstract) ||
                other.abstract == abstract) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.pdf, pdf) || other.pdf == pdf) &&
            (identical(other.slide, slide) || other.slide == slide) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, subject, title, abstract,
      releaseDate, pdf, slide, size, cover, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PressReleaseModelCopyWith<_$_PressReleaseModel> get copyWith =>
      __$$_PressReleaseModelCopyWithImpl<_$_PressReleaseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PressReleaseModelToJson(
      this,
    );
  }
}

abstract class _PressReleaseModel implements PressReleaseModel {
  factory _PressReleaseModel(
          {@JsonKey(name: 'brs_id') required final int id,
          @JsonKey(name: 'subj', readValue: _subjectValueReader)
          final SubjectModel? subject,
          required final String title,
          @AbstractSerializer() required final String abstract,
          @JsonKey(name: 'rl_date') required final DateTime releaseDate,
          required final String pdf,
          required final String slide,
          required final String size,
          @JsonKey(name: 'thumbnail') required final String cover,
          @JsonKey(name: 'updt_date') final DateTime? updatedAt}) =
      _$_PressReleaseModel;

  factory _PressReleaseModel.fromJson(Map<String, dynamic> json) =
      _$_PressReleaseModel.fromJson;

  @override
  @JsonKey(name: 'brs_id')
  int get id;
  @override
  @JsonKey(name: 'subj', readValue: _subjectValueReader)
  SubjectModel? get subject;
  @override
  String get title;
  @override
  @AbstractSerializer()
  String get abstract;
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
  @JsonKey(name: 'updt_date')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PressReleaseModelCopyWith<_$_PressReleaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
