// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vertical_variable_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VerticalVariableModel _$VerticalVariableModelFromJson(
    Map<String, dynamic> json) {
  return _VerticalVariableModel.fromJson(json);
}

/// @nodoc
mixin _$VerticalVariableModel {
  @JsonKey(name: 'kode_ver_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vervar')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_ver_id')
  int get itemID => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_ver_id')
  int? get groupID => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_group_ver_id')
  String? get groupName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerticalVariableModelCopyWith<VerticalVariableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerticalVariableModelCopyWith<$Res> {
  factory $VerticalVariableModelCopyWith(VerticalVariableModel value,
          $Res Function(VerticalVariableModel) then) =
      _$VerticalVariableModelCopyWithImpl<$Res, VerticalVariableModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'kode_ver_id') int id,
      @JsonKey(name: 'vervar') String title,
      @JsonKey(name: 'item_ver_id') int itemID,
      @JsonKey(name: 'group_ver_id') int? groupID,
      @JsonKey(name: 'name_group_ver_id') String? groupName});
}

/// @nodoc
class _$VerticalVariableModelCopyWithImpl<$Res,
        $Val extends VerticalVariableModel>
    implements $VerticalVariableModelCopyWith<$Res> {
  _$VerticalVariableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? itemID = null,
    Object? groupID = freezed,
    Object? groupName = freezed,
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
      itemID: null == itemID
          ? _value.itemID
          : itemID // ignore: cast_nullable_to_non_nullable
              as int,
      groupID: freezed == groupID
          ? _value.groupID
          : groupID // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerticalVariableModelImplCopyWith<$Res>
    implements $VerticalVariableModelCopyWith<$Res> {
  factory _$$VerticalVariableModelImplCopyWith(
          _$VerticalVariableModelImpl value,
          $Res Function(_$VerticalVariableModelImpl) then) =
      __$$VerticalVariableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'kode_ver_id') int id,
      @JsonKey(name: 'vervar') String title,
      @JsonKey(name: 'item_ver_id') int itemID,
      @JsonKey(name: 'group_ver_id') int? groupID,
      @JsonKey(name: 'name_group_ver_id') String? groupName});
}

/// @nodoc
class __$$VerticalVariableModelImplCopyWithImpl<$Res>
    extends _$VerticalVariableModelCopyWithImpl<$Res,
        _$VerticalVariableModelImpl>
    implements _$$VerticalVariableModelImplCopyWith<$Res> {
  __$$VerticalVariableModelImplCopyWithImpl(_$VerticalVariableModelImpl _value,
      $Res Function(_$VerticalVariableModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? itemID = null,
    Object? groupID = freezed,
    Object? groupName = freezed,
  }) {
    return _then(_$VerticalVariableModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      itemID: null == itemID
          ? _value.itemID
          : itemID // ignore: cast_nullable_to_non_nullable
              as int,
      groupID: freezed == groupID
          ? _value.groupID
          : groupID // ignore: cast_nullable_to_non_nullable
              as int?,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerticalVariableModelImpl implements _VerticalVariableModel {
  _$VerticalVariableModelImpl(
      {@JsonKey(name: 'kode_ver_id') required this.id,
      @JsonKey(name: 'vervar') required this.title,
      @JsonKey(name: 'item_ver_id') required this.itemID,
      @JsonKey(name: 'group_ver_id') this.groupID,
      @JsonKey(name: 'name_group_ver_id') this.groupName});

  factory _$VerticalVariableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerticalVariableModelImplFromJson(json);

  @override
  @JsonKey(name: 'kode_ver_id')
  final int id;
  @override
  @JsonKey(name: 'vervar')
  final String title;
  @override
  @JsonKey(name: 'item_ver_id')
  final int itemID;
  @override
  @JsonKey(name: 'group_ver_id')
  final int? groupID;
  @override
  @JsonKey(name: 'name_group_ver_id')
  final String? groupName;

  @override
  String toString() {
    return 'VerticalVariableModel(id: $id, title: $title, itemID: $itemID, groupID: $groupID, groupName: $groupName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerticalVariableModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.itemID, itemID) || other.itemID == itemID) &&
            (identical(other.groupID, groupID) || other.groupID == groupID) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, itemID, groupID, groupName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerticalVariableModelImplCopyWith<_$VerticalVariableModelImpl>
      get copyWith => __$$VerticalVariableModelImplCopyWithImpl<
          _$VerticalVariableModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerticalVariableModelImplToJson(
      this,
    );
  }
}

abstract class _VerticalVariableModel implements VerticalVariableModel {
  factory _VerticalVariableModel(
          {@JsonKey(name: 'kode_ver_id') required final int id,
          @JsonKey(name: 'vervar') required final String title,
          @JsonKey(name: 'item_ver_id') required final int itemID,
          @JsonKey(name: 'group_ver_id') final int? groupID,
          @JsonKey(name: 'name_group_ver_id') final String? groupName}) =
      _$VerticalVariableModelImpl;

  factory _VerticalVariableModel.fromJson(Map<String, dynamic> json) =
      _$VerticalVariableModelImpl.fromJson;

  @override
  @JsonKey(name: 'kode_ver_id')
  int get id;
  @override
  @JsonKey(name: 'vervar')
  String get title;
  @override
  @JsonKey(name: 'item_ver_id')
  int get itemID;
  @override
  @JsonKey(name: 'group_ver_id')
  int? get groupID;
  @override
  @JsonKey(name: 'name_group_ver_id')
  String? get groupName;
  @override
  @JsonKey(ignore: true)
  _$$VerticalVariableModelImplCopyWith<_$VerticalVariableModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
