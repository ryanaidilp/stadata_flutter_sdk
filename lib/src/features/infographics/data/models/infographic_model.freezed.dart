// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, unnecessary_question_mark

part of 'infographic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  @JsonKey(name: 'desc')
  String get description => throw _privateConstructorUsedError;
  int get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'dl')
  String get downloadUrl => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'desc') String description,
      int category,
      @JsonKey(name: 'dl') String downloadUrl});
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
    Object? description = null,
    Object? category = null,
    Object? downloadUrl = null,
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InfographicModelCopyWith<$Res>
    implements $InfographicModelCopyWith<$Res> {
  factory _$$_InfographicModelCopyWith(
          _$_InfographicModel value, $Res Function(_$_InfographicModel) then) =
      __$$_InfographicModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'inf_id') int id,
      String title,
      @JsonKey(name: 'img') String image,
      @JsonKey(name: 'desc') String description,
      int category,
      @JsonKey(name: 'dl') String downloadUrl});
}

/// @nodoc
class __$$_InfographicModelCopyWithImpl<$Res>
    extends _$InfographicModelCopyWithImpl<$Res, _$_InfographicModel>
    implements _$$_InfographicModelCopyWith<$Res> {
  __$$_InfographicModelCopyWithImpl(
      _$_InfographicModel _value, $Res Function(_$_InfographicModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
    Object? description = null,
    Object? category = null,
    Object? downloadUrl = null,
  }) {
    return _then(_$_InfographicModel(
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
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InfographicModel implements _InfographicModel {
  _$_InfographicModel(
      {@JsonKey(name: 'inf_id') required this.id,
      required this.title,
      @JsonKey(name: 'img') required this.image,
      @JsonKey(name: 'desc') required this.description,
      required this.category,
      @JsonKey(name: 'dl') required this.downloadUrl});

  factory _$_InfographicModel.fromJson(Map<String, dynamic> json) =>
      _$$_InfographicModelFromJson(json);

  @override
  @JsonKey(name: 'inf_id')
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'img')
  final String image;
  @override
  @JsonKey(name: 'desc')
  final String description;
  @override
  final int category;
  @override
  @JsonKey(name: 'dl')
  final String downloadUrl;

  @override
  String toString() {
    return 'InfographicModel(id: $id, title: $title, image: $image, description: $description, category: $category, downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InfographicModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, image, description, category, downloadUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InfographicModelCopyWith<_$_InfographicModel> get copyWith =>
      __$$_InfographicModelCopyWithImpl<_$_InfographicModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InfographicModelToJson(
      this,
    );
  }
}

abstract class _InfographicModel implements InfographicModel {
  factory _InfographicModel(
          {@JsonKey(name: 'inf_id') required final int id,
          required final String title,
          @JsonKey(name: 'img') required final String image,
          @JsonKey(name: 'desc') required final String description,
          required final int category,
          @JsonKey(name: 'dl') required final String downloadUrl}) =
      _$_InfographicModel;

  factory _InfographicModel.fromJson(Map<String, dynamic> json) =
      _$_InfographicModel.fromJson;

  @override
  @JsonKey(name: 'inf_id')
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'img')
  String get image;
  @override
  @JsonKey(name: 'desc')
  String get description;
  @override
  int get category;
  @override
  @JsonKey(name: 'dl')
  String get downloadUrl;
  @override
  @JsonKey(ignore: true)
  _$$_InfographicModelCopyWith<_$_InfographicModel> get copyWith =>
      throw _privateConstructorUsedError;
}
