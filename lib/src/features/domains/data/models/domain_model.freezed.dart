// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domain_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DomainModel _$DomainModelFromJson(Map<String, dynamic> json) {
  return _DomainModel.fromJson(json);
}

/// @nodoc
mixin _$DomainModel {
  @JsonKey(name: 'domain_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'domain_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'domain_url')
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DomainModelCopyWith<DomainModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainModelCopyWith<$Res> {
  factory $DomainModelCopyWith(
          DomainModel value, $Res Function(DomainModel) then) =
      _$DomainModelCopyWithImpl<$Res, DomainModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'domain_id') String id,
      @JsonKey(name: 'domain_name') String name,
      @JsonKey(name: 'domain_url') String url});
}

/// @nodoc
class _$DomainModelCopyWithImpl<$Res, $Val extends DomainModel>
    implements $DomainModelCopyWith<$Res> {
  _$DomainModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DomainModelImplCopyWith<$Res>
    implements $DomainModelCopyWith<$Res> {
  factory _$$DomainModelImplCopyWith(
          _$DomainModelImpl value, $Res Function(_$DomainModelImpl) then) =
      __$$DomainModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'domain_id') String id,
      @JsonKey(name: 'domain_name') String name,
      @JsonKey(name: 'domain_url') String url});
}

/// @nodoc
class __$$DomainModelImplCopyWithImpl<$Res>
    extends _$DomainModelCopyWithImpl<$Res, _$DomainModelImpl>
    implements _$$DomainModelImplCopyWith<$Res> {
  __$$DomainModelImplCopyWithImpl(
      _$DomainModelImpl _value, $Res Function(_$DomainModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$DomainModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DomainModelImpl extends _DomainModel {
  const _$DomainModelImpl(
      {@JsonKey(name: 'domain_id') required this.id,
      @JsonKey(name: 'domain_name') required this.name,
      @JsonKey(name: 'domain_url') required this.url})
      : super._();

  factory _$DomainModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DomainModelImplFromJson(json);

  @override
  @JsonKey(name: 'domain_id')
  final String id;
  @override
  @JsonKey(name: 'domain_name')
  final String name;
  @override
  @JsonKey(name: 'domain_url')
  final String url;

  @override
  String toString() {
    return 'DomainModel(id: $id, name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DomainModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DomainModelImplCopyWith<_$DomainModelImpl> get copyWith =>
      __$$DomainModelImplCopyWithImpl<_$DomainModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DomainModelImplToJson(
      this,
    );
  }
}

abstract class _DomainModel extends DomainModel {
  const factory _DomainModel(
          {@JsonKey(name: 'domain_id') required final String id,
          @JsonKey(name: 'domain_name') required final String name,
          @JsonKey(name: 'domain_url') required final String url}) =
      _$DomainModelImpl;
  const _DomainModel._() : super._();

  factory _DomainModel.fromJson(Map<String, dynamic> json) =
      _$DomainModelImpl.fromJson;

  @override
  @JsonKey(name: 'domain_id')
  String get id;
  @override
  @JsonKey(name: 'domain_name')
  String get name;
  @override
  @JsonKey(name: 'domain_url')
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$DomainModelImplCopyWith<_$DomainModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
