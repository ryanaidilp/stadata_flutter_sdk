// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) {
  return _SubjectModel.fromJson(json);
}

/// @nodoc
mixin _$SubjectModel {
  @JsonKey(name: 'sub_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'subcat_id', readValue: _categoryValueReader)
  SubjectCategoryModel? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'ntabel')
  int? get nTable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectModelCopyWith<SubjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectModelCopyWith<$Res> {
  factory $SubjectModelCopyWith(
          SubjectModel value, $Res Function(SubjectModel) then) =
      _$SubjectModelCopyWithImpl<$Res, SubjectModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sub_id') int id,
      @JsonKey(name: 'title') String name,
      @JsonKey(name: 'subcat_id', readValue: _categoryValueReader)
      SubjectCategoryModel? category,
      @JsonKey(name: 'ntabel') int? nTable});

  $SubjectCategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class _$SubjectModelCopyWithImpl<$Res, $Val extends SubjectModel>
    implements $SubjectModelCopyWith<$Res> {
  _$SubjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = freezed,
    Object? nTable = freezed,
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
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as SubjectCategoryModel?,
      nTable: freezed == nTable
          ? _value.nTable
          : nTable // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubjectCategoryModelCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $SubjectCategoryModelCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubjectModelImplCopyWith<$Res>
    implements $SubjectModelCopyWith<$Res> {
  factory _$$SubjectModelImplCopyWith(
          _$SubjectModelImpl value, $Res Function(_$SubjectModelImpl) then) =
      __$$SubjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sub_id') int id,
      @JsonKey(name: 'title') String name,
      @JsonKey(name: 'subcat_id', readValue: _categoryValueReader)
      SubjectCategoryModel? category,
      @JsonKey(name: 'ntabel') int? nTable});

  @override
  $SubjectCategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class __$$SubjectModelImplCopyWithImpl<$Res>
    extends _$SubjectModelCopyWithImpl<$Res, _$SubjectModelImpl>
    implements _$$SubjectModelImplCopyWith<$Res> {
  __$$SubjectModelImplCopyWithImpl(
      _$SubjectModelImpl _value, $Res Function(_$SubjectModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = freezed,
    Object? nTable = freezed,
  }) {
    return _then(_$SubjectModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as SubjectCategoryModel?,
      nTable: freezed == nTable
          ? _value.nTable
          : nTable // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectModelImpl implements _SubjectModel {
  _$SubjectModelImpl(
      {@JsonKey(name: 'sub_id') required this.id,
      @JsonKey(name: 'title') required this.name,
      @JsonKey(name: 'subcat_id', readValue: _categoryValueReader)
      this.category,
      @JsonKey(name: 'ntabel') this.nTable});

  factory _$SubjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectModelImplFromJson(json);

  @override
  @JsonKey(name: 'sub_id')
  final int id;
  @override
  @JsonKey(name: 'title')
  final String name;
  @override
  @JsonKey(name: 'subcat_id', readValue: _categoryValueReader)
  final SubjectCategoryModel? category;
  @override
  @JsonKey(name: 'ntabel')
  final int? nTable;

  @override
  String toString() {
    return 'SubjectModel(id: $id, name: $name, category: $category, nTable: $nTable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.nTable, nTable) || other.nTable == nTable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, category, nTable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectModelImplCopyWith<_$SubjectModelImpl> get copyWith =>
      __$$SubjectModelImplCopyWithImpl<_$SubjectModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectModelImplToJson(
      this,
    );
  }
}

abstract class _SubjectModel implements SubjectModel {
  factory _SubjectModel(
      {@JsonKey(name: 'sub_id') required final int id,
      @JsonKey(name: 'title') required final String name,
      @JsonKey(name: 'subcat_id', readValue: _categoryValueReader)
      final SubjectCategoryModel? category,
      @JsonKey(name: 'ntabel') final int? nTable}) = _$SubjectModelImpl;

  factory _SubjectModel.fromJson(Map<String, dynamic> json) =
      _$SubjectModelImpl.fromJson;

  @override
  @JsonKey(name: 'sub_id')
  int get id;
  @override
  @JsonKey(name: 'title')
  String get name;
  @override
  @JsonKey(name: 'subcat_id', readValue: _categoryValueReader)
  SubjectCategoryModel? get category;
  @override
  @JsonKey(name: 'ntabel')
  int? get nTable;
  @override
  @JsonKey(ignore: true)
  _$$SubjectModelImplCopyWith<_$SubjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
