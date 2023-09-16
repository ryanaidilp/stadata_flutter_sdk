// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'static_table_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StaticTableModel _$StaticTableModelFromJson(Map<String, dynamic> json) {
  return _StaticTableModel.fromJson(json);
}

/// @nodoc
mixin _$StaticTableModel {
  @JsonKey(name: 'table_id')
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'subj_id', readValue: _subjectIdValueReader)
  int get subjectId => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'updt_date')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get excel => throw _privateConstructorUsedError;
  @JsonKey(name: 'subj')
  String? get subject => throw _privateConstructorUsedError;
  @TableSerializer()
  @JsonKey()
  String? get table => throw _privateConstructorUsedError;
  @JsonKey(name: 'cr_date')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaticTableModelCopyWith<StaticTableModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaticTableModelCopyWith<$Res> {
  factory $StaticTableModelCopyWith(
          StaticTableModel value, $Res Function(StaticTableModel) then) =
      _$StaticTableModelCopyWithImpl<$Res, StaticTableModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'table_id') int id,
      String title,
      @JsonKey(name: 'subj_id', readValue: _subjectIdValueReader) int subjectId,
      String size,
      @JsonKey(name: 'updt_date') DateTime updatedAt,
      String excel,
      @JsonKey(name: 'subj') String? subject,
      @TableSerializer() @JsonKey() String? table,
      @JsonKey(name: 'cr_date') DateTime? createdAt});
}

/// @nodoc
class _$StaticTableModelCopyWithImpl<$Res, $Val extends StaticTableModel>
    implements $StaticTableModelCopyWith<$Res> {
  _$StaticTableModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subjectId = null,
    Object? size = null,
    Object? updatedAt = null,
    Object? excel = null,
    Object? subject = freezed,
    Object? table = freezed,
    Object? createdAt = freezed,
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
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      excel: null == excel
          ? _value.excel
          : excel // ignore: cast_nullable_to_non_nullable
              as String,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StaticTableModelCopyWith<$Res>
    implements $StaticTableModelCopyWith<$Res> {
  factory _$$_StaticTableModelCopyWith(
          _$_StaticTableModel value, $Res Function(_$_StaticTableModel) then) =
      __$$_StaticTableModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'table_id') int id,
      String title,
      @JsonKey(name: 'subj_id', readValue: _subjectIdValueReader) int subjectId,
      String size,
      @JsonKey(name: 'updt_date') DateTime updatedAt,
      String excel,
      @JsonKey(name: 'subj') String? subject,
      @TableSerializer() @JsonKey() String? table,
      @JsonKey(name: 'cr_date') DateTime? createdAt});
}

/// @nodoc
class __$$_StaticTableModelCopyWithImpl<$Res>
    extends _$StaticTableModelCopyWithImpl<$Res, _$_StaticTableModel>
    implements _$$_StaticTableModelCopyWith<$Res> {
  __$$_StaticTableModelCopyWithImpl(
      _$_StaticTableModel _value, $Res Function(_$_StaticTableModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? subjectId = null,
    Object? size = null,
    Object? updatedAt = null,
    Object? excel = null,
    Object? subject = freezed,
    Object? table = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_StaticTableModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      excel: null == excel
          ? _value.excel
          : excel // ignore: cast_nullable_to_non_nullable
              as String,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      table: freezed == table
          ? _value.table
          : table // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StaticTableModel implements _StaticTableModel {
  _$_StaticTableModel(
      {@JsonKey(name: 'table_id') required this.id,
      required this.title,
      @JsonKey(name: 'subj_id', readValue: _subjectIdValueReader)
      required this.subjectId,
      required this.size,
      @JsonKey(name: 'updt_date') required this.updatedAt,
      required this.excel,
      @JsonKey(name: 'subj') this.subject,
      @TableSerializer() @JsonKey() this.table,
      @JsonKey(name: 'cr_date') this.createdAt});

  factory _$_StaticTableModel.fromJson(Map<String, dynamic> json) =>
      _$$_StaticTableModelFromJson(json);

  @override
  @JsonKey(name: 'table_id')
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'subj_id', readValue: _subjectIdValueReader)
  final int subjectId;
  @override
  final String size;
  @override
  @JsonKey(name: 'updt_date')
  final DateTime updatedAt;
  @override
  final String excel;
  @override
  @JsonKey(name: 'subj')
  final String? subject;
  @override
  @TableSerializer()
  @JsonKey()
  final String? table;
  @override
  @JsonKey(name: 'cr_date')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'StaticTableModel(id: $id, title: $title, subjectId: $subjectId, size: $size, updatedAt: $updatedAt, excel: $excel, subject: $subject, table: $table, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StaticTableModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.excel, excel) || other.excel == excel) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, subjectId, size,
      updatedAt, excel, subject, table, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StaticTableModelCopyWith<_$_StaticTableModel> get copyWith =>
      __$$_StaticTableModelCopyWithImpl<_$_StaticTableModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StaticTableModelToJson(
      this,
    );
  }
}

abstract class _StaticTableModel implements StaticTableModel {
  factory _StaticTableModel(
          {@JsonKey(name: 'table_id') required final int id,
          required final String title,
          @JsonKey(name: 'subj_id', readValue: _subjectIdValueReader)
          required final int subjectId,
          required final String size,
          @JsonKey(name: 'updt_date') required final DateTime updatedAt,
          required final String excel,
          @JsonKey(name: 'subj') final String? subject,
          @TableSerializer() @JsonKey() final String? table,
          @JsonKey(name: 'cr_date') final DateTime? createdAt}) =
      _$_StaticTableModel;

  factory _StaticTableModel.fromJson(Map<String, dynamic> json) =
      _$_StaticTableModel.fromJson;

  @override
  @JsonKey(name: 'table_id')
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'subj_id', readValue: _subjectIdValueReader)
  int get subjectId;
  @override
  String get size;
  @override
  @JsonKey(name: 'updt_date')
  DateTime get updatedAt;
  @override
  String get excel;
  @override
  @JsonKey(name: 'subj')
  String? get subject;
  @override
  @TableSerializer()
  @JsonKey()
  String? get table;
  @override
  @JsonKey(name: 'cr_date')
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_StaticTableModelCopyWith<_$_StaticTableModel> get copyWith =>
      throw _privateConstructorUsedError;
}
