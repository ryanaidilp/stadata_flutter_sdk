// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'infographic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InfographicModel _$InfographicModelFromJson(Map<String, dynamic> json) {
  return _InfographicModel.fromJson(json);
}

/// @nodoc
mixin _$InfographicModel {
  @JsonKey(name: 'inf_id')
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'img')
  String get image => throw _privateConstructorUsedError;
  int get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'dl')
  String get downloadUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'desc')
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InfographicModelCopyWith<InfographicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfographicModelCopyWith<$Res> {
  factory $InfographicModelCopyWith(
          InfographicModel value, $Res Function(InfographicModel) then) =
      _$InfographicModelCopyWithImpl<$Res, InfographicModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'inf_id') int id,
      String title,
      @JsonKey(name: 'img') String image,
      int category,
      @JsonKey(name: 'dl') String downloadUrl,
      @JsonKey(name: 'desc') String? description});
}

/// @nodoc
class _$InfographicModelCopyWithImpl<$Res, $Val extends InfographicModel>
    implements $InfographicModelCopyWith<$Res> {
  _$InfographicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
    Object? category = null,
    Object? downloadUrl = null,
    Object? description = freezed,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InfographicModelImplCopyWith<$Res>
    implements $InfographicModelCopyWith<$Res> {
  factory _$$InfographicModelImplCopyWith(_$InfographicModelImpl value,
          $Res Function(_$InfographicModelImpl) then) =
      __$$InfographicModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'inf_id') int id,
      String title,
      @JsonKey(name: 'img') String image,
      int category,
      @JsonKey(name: 'dl') String downloadUrl,
      @JsonKey(name: 'desc') String? description});
}

/// @nodoc
class __$$InfographicModelImplCopyWithImpl<$Res>
    extends _$InfographicModelCopyWithImpl<$Res, _$InfographicModelImpl>
    implements _$$InfographicModelImplCopyWith<$Res> {
  __$$InfographicModelImplCopyWithImpl(_$InfographicModelImpl _value,
      $Res Function(_$InfographicModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
    Object? category = null,
    Object? downloadUrl = null,
    Object? description = freezed,
  }) {
    return _then(_$InfographicModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfographicModelImpl implements _InfographicModel {
  _$InfographicModelImpl(
      {@JsonKey(name: 'inf_id') required this.id,
      required this.title,
      @JsonKey(name: 'img') required this.image,
      required this.category,
      @JsonKey(name: 'dl') required this.downloadUrl,
      @JsonKey(name: 'desc') this.description});

  factory _$InfographicModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfographicModelImplFromJson(json);

  @override
  @JsonKey(name: 'inf_id')
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'img')
  final String image;
  @override
  final int category;
  @override
  @JsonKey(name: 'dl')
  final String downloadUrl;
  @override
  @JsonKey(name: 'desc')
  final String? description;

  @override
  String toString() {
    return 'InfographicModel(id: $id, title: $title, image: $image, category: $category, downloadUrl: $downloadUrl, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfographicModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, image, category, downloadUrl, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InfographicModelImplCopyWith<_$InfographicModelImpl> get copyWith =>
      __$$InfographicModelImplCopyWithImpl<_$InfographicModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfographicModelImplToJson(
      this,
    );
  }
}

abstract class _InfographicModel implements InfographicModel {
  factory _InfographicModel(
          {@JsonKey(name: 'inf_id') required final int id,
          required final String title,
          @JsonKey(name: 'img') required final String image,
          required final int category,
          @JsonKey(name: 'dl') required final String downloadUrl,
          @JsonKey(name: 'desc') final String? description}) =
      _$InfographicModelImpl;

  factory _InfographicModel.fromJson(Map<String, dynamic> json) =
      _$InfographicModelImpl.fromJson;

  @override
  @JsonKey(name: 'inf_id')
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'img')
  String get image;
  @override
  int get category;
  @override
  @JsonKey(name: 'dl')
  String get downloadUrl;
  @override
  @JsonKey(name: 'desc')
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$InfographicModelImplCopyWith<_$InfographicModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
