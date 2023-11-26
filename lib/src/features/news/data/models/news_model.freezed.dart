// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return _NewsModel.fromJson(json);
}

/// @nodoc
mixin _$NewsModel {
  @JsonKey(name: 'news_id')
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @NewsSerializer()
  @JsonKey(name: 'news')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'newscat_id', readValue: _newsCatIdValueReader)
  String get categoryId => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  @JsonKey(name: 'rl_date')
  DateTime get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'newscat_name')
  String? get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsModelCopyWith<NewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsModelCopyWith<$Res> {
  factory $NewsModelCopyWith(NewsModel value, $Res Function(NewsModel) then) =
      _$NewsModelCopyWithImpl<$Res, NewsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'news_id') int id,
      String title,
      @NewsSerializer() @JsonKey(name: 'news') String content,
      @JsonKey(name: 'newscat_id', readValue: _newsCatIdValueReader)
      String categoryId,
      String picture,
      @JsonKey(name: 'rl_date') DateTime releaseDate,
      @JsonKey(name: 'newscat_name') String? category});
}

/// @nodoc
class _$NewsModelCopyWithImpl<$Res, $Val extends NewsModel>
    implements $NewsModelCopyWith<$Res> {
  _$NewsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? categoryId = null,
    Object? picture = null,
    Object? releaseDate = null,
    Object? category = freezed,
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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsModelImplCopyWith<$Res>
    implements $NewsModelCopyWith<$Res> {
  factory _$$NewsModelImplCopyWith(
          _$NewsModelImpl value, $Res Function(_$NewsModelImpl) then) =
      __$$NewsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'news_id') int id,
      String title,
      @NewsSerializer() @JsonKey(name: 'news') String content,
      @JsonKey(name: 'newscat_id', readValue: _newsCatIdValueReader)
      String categoryId,
      String picture,
      @JsonKey(name: 'rl_date') DateTime releaseDate,
      @JsonKey(name: 'newscat_name') String? category});
}

/// @nodoc
class __$$NewsModelImplCopyWithImpl<$Res>
    extends _$NewsModelCopyWithImpl<$Res, _$NewsModelImpl>
    implements _$$NewsModelImplCopyWith<$Res> {
  __$$NewsModelImplCopyWithImpl(
      _$NewsModelImpl _value, $Res Function(_$NewsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? categoryId = null,
    Object? picture = null,
    Object? releaseDate = null,
    Object? category = freezed,
  }) {
    return _then(_$NewsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsModelImpl implements _NewsModel {
  _$NewsModelImpl(
      {@JsonKey(name: 'news_id') required this.id,
      required this.title,
      @NewsSerializer() @JsonKey(name: 'news') required this.content,
      @JsonKey(name: 'newscat_id', readValue: _newsCatIdValueReader)
      required this.categoryId,
      required this.picture,
      @JsonKey(name: 'rl_date') required this.releaseDate,
      @JsonKey(name: 'newscat_name') this.category});

  factory _$NewsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsModelImplFromJson(json);

  @override
  @JsonKey(name: 'news_id')
  final int id;
  @override
  final String title;
  @override
  @NewsSerializer()
  @JsonKey(name: 'news')
  final String content;
  @override
  @JsonKey(name: 'newscat_id', readValue: _newsCatIdValueReader)
  final String categoryId;
  @override
  final String picture;
  @override
  @JsonKey(name: 'rl_date')
  final DateTime releaseDate;
  @override
  @JsonKey(name: 'newscat_name')
  final String? category;

  @override
  String toString() {
    return 'NewsModel(id: $id, title: $title, content: $content, categoryId: $categoryId, picture: $picture, releaseDate: $releaseDate, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content, categoryId,
      picture, releaseDate, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsModelImplCopyWith<_$NewsModelImpl> get copyWith =>
      __$$NewsModelImplCopyWithImpl<_$NewsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsModelImplToJson(
      this,
    );
  }
}

abstract class _NewsModel implements NewsModel {
  factory _NewsModel(
      {@JsonKey(name: 'news_id') required final int id,
      required final String title,
      @NewsSerializer() @JsonKey(name: 'news') required final String content,
      @JsonKey(name: 'newscat_id', readValue: _newsCatIdValueReader)
      required final String categoryId,
      required final String picture,
      @JsonKey(name: 'rl_date') required final DateTime releaseDate,
      @JsonKey(name: 'newscat_name') final String? category}) = _$NewsModelImpl;

  factory _NewsModel.fromJson(Map<String, dynamic> json) =
      _$NewsModelImpl.fromJson;

  @override
  @JsonKey(name: 'news_id')
  int get id;
  @override
  String get title;
  @override
  @NewsSerializer()
  @JsonKey(name: 'news')
  String get content;
  @override
  @JsonKey(name: 'newscat_id', readValue: _newsCatIdValueReader)
  String get categoryId;
  @override
  String get picture;
  @override
  @JsonKey(name: 'rl_date')
  DateTime get releaseDate;
  @override
  @JsonKey(name: 'newscat_name')
  String? get category;
  @override
  @JsonKey(ignore: true)
  _$$NewsModelImplCopyWith<_$NewsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
