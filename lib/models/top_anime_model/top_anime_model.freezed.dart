// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_anime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TopAnimeModel _$TopAnimeModelFromJson(Map<String, dynamic> json) {
  return _TopAnimeModel.fromJson(json);
}

/// @nodoc
mixin _$TopAnimeModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// Serializes this TopAnimeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopAnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopAnimeModelCopyWith<TopAnimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopAnimeModelCopyWith<$Res> {
  factory $TopAnimeModelCopyWith(
          TopAnimeModel value, $Res Function(TopAnimeModel) then) =
      _$TopAnimeModelCopyWithImpl<$Res, TopAnimeModel>;
  @useResult
  $Res call({String id, String title, String image});
}

/// @nodoc
class _$TopAnimeModelCopyWithImpl<$Res, $Val extends TopAnimeModel>
    implements $TopAnimeModelCopyWith<$Res> {
  _$TopAnimeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopAnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopAnimeModelImplCopyWith<$Res>
    implements $TopAnimeModelCopyWith<$Res> {
  factory _$$TopAnimeModelImplCopyWith(
          _$TopAnimeModelImpl value, $Res Function(_$TopAnimeModelImpl) then) =
      __$$TopAnimeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String image});
}

/// @nodoc
class __$$TopAnimeModelImplCopyWithImpl<$Res>
    extends _$TopAnimeModelCopyWithImpl<$Res, _$TopAnimeModelImpl>
    implements _$$TopAnimeModelImplCopyWith<$Res> {
  __$$TopAnimeModelImplCopyWithImpl(
      _$TopAnimeModelImpl _value, $Res Function(_$TopAnimeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopAnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = null,
  }) {
    return _then(_$TopAnimeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopAnimeModelImpl implements _TopAnimeModel {
  _$TopAnimeModelImpl(
      {this.id = 'Unknown ID', this.title = 'Unknown title', this.image = ''});

  factory _$TopAnimeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopAnimeModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String image;

  @override
  String toString() {
    return 'TopAnimeModel(id: $id, title: $title, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopAnimeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, image);

  /// Create a copy of TopAnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopAnimeModelImplCopyWith<_$TopAnimeModelImpl> get copyWith =>
      __$$TopAnimeModelImplCopyWithImpl<_$TopAnimeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopAnimeModelImplToJson(
      this,
    );
  }
}

abstract class _TopAnimeModel implements TopAnimeModel {
  factory _TopAnimeModel(
      {final String id,
      final String title,
      final String image}) = _$TopAnimeModelImpl;

  factory _TopAnimeModel.fromJson(Map<String, dynamic> json) =
      _$TopAnimeModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get image;

  /// Create a copy of TopAnimeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopAnimeModelImplCopyWith<_$TopAnimeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
