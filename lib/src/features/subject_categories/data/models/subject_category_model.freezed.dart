// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubjectCategoryModel _$SubjectCategoryModelFromJson(Map<String, dynamic> json) {
  return _SubjectCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$SubjectCategoryModel {
  @JsonKey(name: 'subcat_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectCategoryModelCopyWith<SubjectCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCategoryModelCopyWith<$Res> {
  factory $SubjectCategoryModelCopyWith(SubjectCategoryModel value,
          $Res Function(SubjectCategoryModel) then) =
      _$SubjectCategoryModelCopyWithImpl<$Res, SubjectCategoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'subcat_id') int id,
      @JsonKey(name: 'title') String name});
}

/// @nodoc
class _$SubjectCategoryModelCopyWithImpl<$Res,
        $Val extends SubjectCategoryModel>
    implements $SubjectCategoryModelCopyWith<$Res> {
  _$SubjectCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubjectCategoryModelCopyWith<$Res>
    implements $SubjectCategoryModelCopyWith<$Res> {
  factory _$$_SubjectCategoryModelCopyWith(_$_SubjectCategoryModel value,
          $Res Function(_$_SubjectCategoryModel) then) =
      __$$_SubjectCategoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'subcat_id') int id,
      @JsonKey(name: 'title') String name});
}

/// @nodoc
class __$$_SubjectCategoryModelCopyWithImpl<$Res>
    extends _$SubjectCategoryModelCopyWithImpl<$Res, _$_SubjectCategoryModel>
    implements _$$_SubjectCategoryModelCopyWith<$Res> {
  __$$_SubjectCategoryModelCopyWithImpl(_$_SubjectCategoryModel _value,
      $Res Function(_$_SubjectCategoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_SubjectCategoryModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubjectCategoryModel implements _SubjectCategoryModel {
  _$_SubjectCategoryModel(
      {@JsonKey(name: 'subcat_id') required this.id,
      @JsonKey(name: 'title') required this.name});

  factory _$_SubjectCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_SubjectCategoryModelFromJson(json);

  @override
  @JsonKey(name: 'subcat_id')
  final int id;
  @override
  @JsonKey(name: 'title')
  final String name;

  @override
  String toString() {
    return 'SubjectCategoryModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubjectCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubjectCategoryModelCopyWith<_$_SubjectCategoryModel> get copyWith =>
      __$$_SubjectCategoryModelCopyWithImpl<_$_SubjectCategoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubjectCategoryModelToJson(
      this,
    );
  }
}

abstract class _SubjectCategoryModel implements SubjectCategoryModel {
  factory _SubjectCategoryModel(
          {@JsonKey(name: 'subcat_id') required final int id,
          @JsonKey(name: 'title') required final String name}) =
      _$_SubjectCategoryModel;

  factory _SubjectCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_SubjectCategoryModel.fromJson;

  @override
  @JsonKey(name: 'subcat_id')
  int get id;
  @override
  @JsonKey(name: 'title')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_SubjectCategoryModelCopyWith<_$_SubjectCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
