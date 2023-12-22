// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variable_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VariableModel _$VariableModelFromJson(Map<String, dynamic> json) {
  return _VariableModel.fromJson(json);
}

/// @nodoc
mixin _$VariableModel {
  @JsonKey(name: 'var_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String? get graphName => throw _privateConstructorUsedError;
  @JsonKey()
  String get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_id')
  int get subjectID => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_name')
  String get subjectName => throw _privateConstructorUsedError;
  @JsonKey()
  String get title => throw _privateConstructorUsedError;
  @JsonKey()
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'vertical')
  int get verticalVariableID => throw _privateConstructorUsedError;
  @JsonKey(name: 'subcsa_id')
  int? get csaSubjectID => throw _privateConstructorUsedError;
  @JsonKey(name: 'subcsa_name')
  String? get csaSubjectName => throw _privateConstructorUsedError;
  @JsonKey()
  int? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'turth')
  int? get derivedPeriodID => throw _privateConstructorUsedError;
  @JsonKey(name: 'turvar')
  int? get derivedVariableID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VariableModelCopyWith<VariableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariableModelCopyWith<$Res> {
  factory $VariableModelCopyWith(
          VariableModel value, $Res Function(VariableModel) then) =
      _$VariableModelCopyWithImpl<$Res, VariableModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'var_id') int id,
      @JsonKey(defaultValue: '') String? graphName,
      @JsonKey() String notes,
      @JsonKey(name: 'sub_id') int subjectID,
      @JsonKey(name: 'sub_name') String subjectName,
      @JsonKey() String title,
      @JsonKey() String unit,
      @JsonKey(name: 'vertical') int verticalVariableID,
      @JsonKey(name: 'subcsa_id') int? csaSubjectID,
      @JsonKey(name: 'subcsa_name') String? csaSubjectName,
      @JsonKey() int? type,
      @JsonKey(name: 'turth') int? derivedPeriodID,
      @JsonKey(name: 'turvar') int? derivedVariableID});
}

/// @nodoc
class _$VariableModelCopyWithImpl<$Res, $Val extends VariableModel>
    implements $VariableModelCopyWith<$Res> {
  _$VariableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? graphName = freezed,
    Object? notes = null,
    Object? subjectID = null,
    Object? subjectName = null,
    Object? title = null,
    Object? unit = null,
    Object? verticalVariableID = null,
    Object? csaSubjectID = freezed,
    Object? csaSubjectName = freezed,
    Object? type = freezed,
    Object? derivedPeriodID = freezed,
    Object? derivedVariableID = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      graphName: freezed == graphName
          ? _value.graphName
          : graphName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      subjectID: null == subjectID
          ? _value.subjectID
          : subjectID // ignore: cast_nullable_to_non_nullable
              as int,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      verticalVariableID: null == verticalVariableID
          ? _value.verticalVariableID
          : verticalVariableID // ignore: cast_nullable_to_non_nullable
              as int,
      csaSubjectID: freezed == csaSubjectID
          ? _value.csaSubjectID
          : csaSubjectID // ignore: cast_nullable_to_non_nullable
              as int?,
      csaSubjectName: freezed == csaSubjectName
          ? _value.csaSubjectName
          : csaSubjectName // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      derivedPeriodID: freezed == derivedPeriodID
          ? _value.derivedPeriodID
          : derivedPeriodID // ignore: cast_nullable_to_non_nullable
              as int?,
      derivedVariableID: freezed == derivedVariableID
          ? _value.derivedVariableID
          : derivedVariableID // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariableModelImplCopyWith<$Res>
    implements $VariableModelCopyWith<$Res> {
  factory _$$VariableModelImplCopyWith(
          _$VariableModelImpl value, $Res Function(_$VariableModelImpl) then) =
      __$$VariableModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'var_id') int id,
      @JsonKey(defaultValue: '') String? graphName,
      @JsonKey() String notes,
      @JsonKey(name: 'sub_id') int subjectID,
      @JsonKey(name: 'sub_name') String subjectName,
      @JsonKey() String title,
      @JsonKey() String unit,
      @JsonKey(name: 'vertical') int verticalVariableID,
      @JsonKey(name: 'subcsa_id') int? csaSubjectID,
      @JsonKey(name: 'subcsa_name') String? csaSubjectName,
      @JsonKey() int? type,
      @JsonKey(name: 'turth') int? derivedPeriodID,
      @JsonKey(name: 'turvar') int? derivedVariableID});
}

/// @nodoc
class __$$VariableModelImplCopyWithImpl<$Res>
    extends _$VariableModelCopyWithImpl<$Res, _$VariableModelImpl>
    implements _$$VariableModelImplCopyWith<$Res> {
  __$$VariableModelImplCopyWithImpl(
      _$VariableModelImpl _value, $Res Function(_$VariableModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? graphName = freezed,
    Object? notes = null,
    Object? subjectID = null,
    Object? subjectName = null,
    Object? title = null,
    Object? unit = null,
    Object? verticalVariableID = null,
    Object? csaSubjectID = freezed,
    Object? csaSubjectName = freezed,
    Object? type = freezed,
    Object? derivedPeriodID = freezed,
    Object? derivedVariableID = freezed,
  }) {
    return _then(_$VariableModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      graphName: freezed == graphName
          ? _value.graphName
          : graphName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      subjectID: null == subjectID
          ? _value.subjectID
          : subjectID // ignore: cast_nullable_to_non_nullable
              as int,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      verticalVariableID: null == verticalVariableID
          ? _value.verticalVariableID
          : verticalVariableID // ignore: cast_nullable_to_non_nullable
              as int,
      csaSubjectID: freezed == csaSubjectID
          ? _value.csaSubjectID
          : csaSubjectID // ignore: cast_nullable_to_non_nullable
              as int?,
      csaSubjectName: freezed == csaSubjectName
          ? _value.csaSubjectName
          : csaSubjectName // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      derivedPeriodID: freezed == derivedPeriodID
          ? _value.derivedPeriodID
          : derivedPeriodID // ignore: cast_nullable_to_non_nullable
              as int?,
      derivedVariableID: freezed == derivedVariableID
          ? _value.derivedVariableID
          : derivedVariableID // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VariableModelImpl implements _VariableModel {
  _$VariableModelImpl(
      {@JsonKey(name: 'var_id') required this.id,
      @JsonKey(defaultValue: '') this.graphName,
      @JsonKey() required this.notes,
      @JsonKey(name: 'sub_id') required this.subjectID,
      @JsonKey(name: 'sub_name') required this.subjectName,
      @JsonKey() required this.title,
      @JsonKey() required this.unit,
      @JsonKey(name: 'vertical') required this.verticalVariableID,
      @JsonKey(name: 'subcsa_id') this.csaSubjectID,
      @JsonKey(name: 'subcsa_name') this.csaSubjectName,
      @JsonKey() this.type,
      @JsonKey(name: 'turth') this.derivedPeriodID,
      @JsonKey(name: 'turvar') this.derivedVariableID});

  factory _$VariableModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariableModelImplFromJson(json);

  @override
  @JsonKey(name: 'var_id')
  final int id;
  @override
  @JsonKey(defaultValue: '')
  final String? graphName;
  @override
  @JsonKey()
  final String notes;
  @override
  @JsonKey(name: 'sub_id')
  final int subjectID;
  @override
  @JsonKey(name: 'sub_name')
  final String subjectName;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String unit;
  @override
  @JsonKey(name: 'vertical')
  final int verticalVariableID;
  @override
  @JsonKey(name: 'subcsa_id')
  final int? csaSubjectID;
  @override
  @JsonKey(name: 'subcsa_name')
  final String? csaSubjectName;
  @override
  @JsonKey()
  final int? type;
  @override
  @JsonKey(name: 'turth')
  final int? derivedPeriodID;
  @override
  @JsonKey(name: 'turvar')
  final int? derivedVariableID;

  @override
  String toString() {
    return 'VariableModel(id: $id, graphName: $graphName, notes: $notes, subjectID: $subjectID, subjectName: $subjectName, title: $title, unit: $unit, verticalVariableID: $verticalVariableID, csaSubjectID: $csaSubjectID, csaSubjectName: $csaSubjectName, type: $type, derivedPeriodID: $derivedPeriodID, derivedVariableID: $derivedVariableID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariableModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.graphName, graphName) ||
                other.graphName == graphName) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.subjectID, subjectID) ||
                other.subjectID == subjectID) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.verticalVariableID, verticalVariableID) ||
                other.verticalVariableID == verticalVariableID) &&
            (identical(other.csaSubjectID, csaSubjectID) ||
                other.csaSubjectID == csaSubjectID) &&
            (identical(other.csaSubjectName, csaSubjectName) ||
                other.csaSubjectName == csaSubjectName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.derivedPeriodID, derivedPeriodID) ||
                other.derivedPeriodID == derivedPeriodID) &&
            (identical(other.derivedVariableID, derivedVariableID) ||
                other.derivedVariableID == derivedVariableID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      graphName,
      notes,
      subjectID,
      subjectName,
      title,
      unit,
      verticalVariableID,
      csaSubjectID,
      csaSubjectName,
      type,
      derivedPeriodID,
      derivedVariableID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VariableModelImplCopyWith<_$VariableModelImpl> get copyWith =>
      __$$VariableModelImplCopyWithImpl<_$VariableModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariableModelImplToJson(
      this,
    );
  }
}

abstract class _VariableModel implements VariableModel {
  factory _VariableModel(
          {@JsonKey(name: 'var_id') required final int id,
          @JsonKey(defaultValue: '') final String? graphName,
          @JsonKey() required final String notes,
          @JsonKey(name: 'sub_id') required final int subjectID,
          @JsonKey(name: 'sub_name') required final String subjectName,
          @JsonKey() required final String title,
          @JsonKey() required final String unit,
          @JsonKey(name: 'vertical') required final int verticalVariableID,
          @JsonKey(name: 'subcsa_id') final int? csaSubjectID,
          @JsonKey(name: 'subcsa_name') final String? csaSubjectName,
          @JsonKey() final int? type,
          @JsonKey(name: 'turth') final int? derivedPeriodID,
          @JsonKey(name: 'turvar') final int? derivedVariableID}) =
      _$VariableModelImpl;

  factory _VariableModel.fromJson(Map<String, dynamic> json) =
      _$VariableModelImpl.fromJson;

  @override
  @JsonKey(name: 'var_id')
  int get id;
  @override
  @JsonKey(defaultValue: '')
  String? get graphName;
  @override
  @JsonKey()
  String get notes;
  @override
  @JsonKey(name: 'sub_id')
  int get subjectID;
  @override
  @JsonKey(name: 'sub_name')
  String get subjectName;
  @override
  @JsonKey()
  String get title;
  @override
  @JsonKey()
  String get unit;
  @override
  @JsonKey(name: 'vertical')
  int get verticalVariableID;
  @override
  @JsonKey(name: 'subcsa_id')
  int? get csaSubjectID;
  @override
  @JsonKey(name: 'subcsa_name')
  String? get csaSubjectName;
  @override
  @JsonKey()
  int? get type;
  @override
  @JsonKey(name: 'turth')
  int? get derivedPeriodID;
  @override
  @JsonKey(name: 'turvar')
  int? get derivedVariableID;
  @override
  @JsonKey(ignore: true)
  _$$VariableModelImplCopyWith<_$VariableModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
