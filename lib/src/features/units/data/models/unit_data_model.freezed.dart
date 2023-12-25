// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitDataModel _$UnitDataModelFromJson(Map<String, dynamic> json) {
  return _UnitDataModel.fromJson(json);
}

/// @nodoc
mixin _$UnitDataModel {
  @JsonKey(name: 'unit_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit', defaultValue: '-')
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitDataModelCopyWith<UnitDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitDataModelCopyWith<$Res> {
  factory $UnitDataModelCopyWith(
          UnitDataModel value, $Res Function(UnitDataModel) then) =
      _$UnitDataModelCopyWithImpl<$Res, UnitDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'unit_id') int id,
      @JsonKey(name: 'unit', defaultValue: '-') String title});
}

/// @nodoc
class _$UnitDataModelCopyWithImpl<$Res, $Val extends UnitDataModel>
    implements $UnitDataModelCopyWith<$Res> {
  _$UnitDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnitDataModelImplCopyWith<$Res>
    implements $UnitDataModelCopyWith<$Res> {
  factory _$$UnitDataModelImplCopyWith(
          _$UnitDataModelImpl value, $Res Function(_$UnitDataModelImpl) then) =
      __$$UnitDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'unit_id') int id,
      @JsonKey(name: 'unit', defaultValue: '-') String title});
}

/// @nodoc
class __$$UnitDataModelImplCopyWithImpl<$Res>
    extends _$UnitDataModelCopyWithImpl<$Res, _$UnitDataModelImpl>
    implements _$$UnitDataModelImplCopyWith<$Res> {
  __$$UnitDataModelImplCopyWithImpl(
      _$UnitDataModelImpl _value, $Res Function(_$UnitDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$UnitDataModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnitDataModelImpl implements _UnitDataModel {
  _$UnitDataModelImpl(
      {@JsonKey(name: 'unit_id') required this.id,
      @JsonKey(name: 'unit', defaultValue: '-') required this.title});

  factory _$UnitDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'unit_id')
  final int id;
  @override
  @JsonKey(name: 'unit', defaultValue: '-')
  final String title;

  @override
  String toString() {
    return 'UnitDataModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnitDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitDataModelImplCopyWith<_$UnitDataModelImpl> get copyWith =>
      __$$UnitDataModelImplCopyWithImpl<_$UnitDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitDataModelImplToJson(
      this,
    );
  }
}

abstract class _UnitDataModel implements UnitDataModel {
  factory _UnitDataModel(
      {@JsonKey(name: 'unit_id') required final int id,
      @JsonKey(name: 'unit', defaultValue: '-')
      required final String title}) = _$UnitDataModelImpl;

  factory _UnitDataModel.fromJson(Map<String, dynamic> json) =
      _$UnitDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'unit_id')
  int get id;
  @override
  @JsonKey(name: 'unit', defaultValue: '-')
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$UnitDataModelImplCopyWith<_$UnitDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
