// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strategic_indicator_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StrategicIndicatorModel _$StrategicIndicatorModelFromJson(
    Map<String, dynamic> json) {
  return _StrategicIndicatorModel.fromJson(json);
}

/// @nodoc
mixin _$StrategicIndicatorModel {
  @JsonKey(name: 'indicator_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'var')
  int get variableID => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject_csa')
  int get csaSubjectID => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  int get categoryID => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get dataSource => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'hash_id')
  String get hashID => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StrategicIndicatorModelCopyWith<StrategicIndicatorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrategicIndicatorModelCopyWith<$Res> {
  factory $StrategicIndicatorModelCopyWith(StrategicIndicatorModel value,
          $Res Function(StrategicIndicatorModel) then) =
      _$StrategicIndicatorModelCopyWithImpl<$Res, StrategicIndicatorModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'indicator_id') int id,
      @JsonKey(name: 'var') int variableID,
      @JsonKey(name: 'subject_csa') int csaSubjectID,
      @JsonKey(name: 'category') int categoryID,
      String name,
      String title,
      String dataSource,
      double value,
      String unit,
      @JsonKey(name: 'hash_id') String hashID,
      String period});
}

/// @nodoc
class _$StrategicIndicatorModelCopyWithImpl<$Res,
        $Val extends StrategicIndicatorModel>
    implements $StrategicIndicatorModelCopyWith<$Res> {
  _$StrategicIndicatorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? variableID = null,
    Object? csaSubjectID = null,
    Object? categoryID = null,
    Object? name = null,
    Object? title = null,
    Object? dataSource = null,
    Object? value = null,
    Object? unit = null,
    Object? hashID = null,
    Object? period = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      variableID: null == variableID
          ? _value.variableID
          : variableID // ignore: cast_nullable_to_non_nullable
              as int,
      csaSubjectID: null == csaSubjectID
          ? _value.csaSubjectID
          : csaSubjectID // ignore: cast_nullable_to_non_nullable
              as int,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dataSource: null == dataSource
          ? _value.dataSource
          : dataSource // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      hashID: null == hashID
          ? _value.hashID
          : hashID // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StrategicIndicatorModelImplCopyWith<$Res>
    implements $StrategicIndicatorModelCopyWith<$Res> {
  factory _$$StrategicIndicatorModelImplCopyWith(
          _$StrategicIndicatorModelImpl value,
          $Res Function(_$StrategicIndicatorModelImpl) then) =
      __$$StrategicIndicatorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'indicator_id') int id,
      @JsonKey(name: 'var') int variableID,
      @JsonKey(name: 'subject_csa') int csaSubjectID,
      @JsonKey(name: 'category') int categoryID,
      String name,
      String title,
      String dataSource,
      double value,
      String unit,
      @JsonKey(name: 'hash_id') String hashID,
      String period});
}

/// @nodoc
class __$$StrategicIndicatorModelImplCopyWithImpl<$Res>
    extends _$StrategicIndicatorModelCopyWithImpl<$Res,
        _$StrategicIndicatorModelImpl>
    implements _$$StrategicIndicatorModelImplCopyWith<$Res> {
  __$$StrategicIndicatorModelImplCopyWithImpl(
      _$StrategicIndicatorModelImpl _value,
      $Res Function(_$StrategicIndicatorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? variableID = null,
    Object? csaSubjectID = null,
    Object? categoryID = null,
    Object? name = null,
    Object? title = null,
    Object? dataSource = null,
    Object? value = null,
    Object? unit = null,
    Object? hashID = null,
    Object? period = null,
  }) {
    return _then(_$StrategicIndicatorModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      variableID: null == variableID
          ? _value.variableID
          : variableID // ignore: cast_nullable_to_non_nullable
              as int,
      csaSubjectID: null == csaSubjectID
          ? _value.csaSubjectID
          : csaSubjectID // ignore: cast_nullable_to_non_nullable
              as int,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dataSource: null == dataSource
          ? _value.dataSource
          : dataSource // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      hashID: null == hashID
          ? _value.hashID
          : hashID // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StrategicIndicatorModelImpl implements _StrategicIndicatorModel {
  _$StrategicIndicatorModelImpl(
      {@JsonKey(name: 'indicator_id') required this.id,
      @JsonKey(name: 'var') required this.variableID,
      @JsonKey(name: 'subject_csa') required this.csaSubjectID,
      @JsonKey(name: 'category') required this.categoryID,
      required this.name,
      required this.title,
      required this.dataSource,
      required this.value,
      required this.unit,
      @JsonKey(name: 'hash_id') required this.hashID,
      required this.period});

  factory _$StrategicIndicatorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrategicIndicatorModelImplFromJson(json);

  @override
  @JsonKey(name: 'indicator_id')
  final int id;
  @override
  @JsonKey(name: 'var')
  final int variableID;
  @override
  @JsonKey(name: 'subject_csa')
  final int csaSubjectID;
  @override
  @JsonKey(name: 'category')
  final int categoryID;
  @override
  final String name;
  @override
  final String title;
  @override
  final String dataSource;
  @override
  final double value;
  @override
  final String unit;
  @override
  @JsonKey(name: 'hash_id')
  final String hashID;
  @override
  final String period;

  @override
  String toString() {
    return 'StrategicIndicatorModel(id: $id, variableID: $variableID, csaSubjectID: $csaSubjectID, categoryID: $categoryID, name: $name, title: $title, dataSource: $dataSource, value: $value, unit: $unit, hashID: $hashID, period: $period)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrategicIndicatorModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.variableID, variableID) ||
                other.variableID == variableID) &&
            (identical(other.csaSubjectID, csaSubjectID) ||
                other.csaSubjectID == csaSubjectID) &&
            (identical(other.categoryID, categoryID) ||
                other.categoryID == categoryID) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dataSource, dataSource) ||
                other.dataSource == dataSource) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.hashID, hashID) || other.hashID == hashID) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, variableID, csaSubjectID,
      categoryID, name, title, dataSource, value, unit, hashID, period);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StrategicIndicatorModelImplCopyWith<_$StrategicIndicatorModelImpl>
      get copyWith => __$$StrategicIndicatorModelImplCopyWithImpl<
          _$StrategicIndicatorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrategicIndicatorModelImplToJson(
      this,
    );
  }
}

abstract class _StrategicIndicatorModel implements StrategicIndicatorModel {
  factory _StrategicIndicatorModel(
      {@JsonKey(name: 'indicator_id') required final int id,
      @JsonKey(name: 'var') required final int variableID,
      @JsonKey(name: 'subject_csa') required final int csaSubjectID,
      @JsonKey(name: 'category') required final int categoryID,
      required final String name,
      required final String title,
      required final String dataSource,
      required final double value,
      required final String unit,
      @JsonKey(name: 'hash_id') required final String hashID,
      required final String period}) = _$StrategicIndicatorModelImpl;

  factory _StrategicIndicatorModel.fromJson(Map<String, dynamic> json) =
      _$StrategicIndicatorModelImpl.fromJson;

  @override
  @JsonKey(name: 'indicator_id')
  int get id;
  @override
  @JsonKey(name: 'var')
  int get variableID;
  @override
  @JsonKey(name: 'subject_csa')
  int get csaSubjectID;
  @override
  @JsonKey(name: 'category')
  int get categoryID;
  @override
  String get name;
  @override
  String get title;
  @override
  String get dataSource;
  @override
  double get value;
  @override
  String get unit;
  @override
  @JsonKey(name: 'hash_id')
  String get hashID;
  @override
  String get period;
  @override
  @JsonKey(ignore: true)
  _$$StrategicIndicatorModelImplCopyWith<_$StrategicIndicatorModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
