// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remainder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemainderModel _$RemainderModelFromJson(Map<String, dynamic> json) {
  return _RemainderModel.fromJson(json);
}

/// @nodoc
mixin _$RemainderModel {
  int get id => throw _privateConstructorUsedError;
  String get animeId => throw _privateConstructorUsedError;
  String get day => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;

  /// Serializes this RemainderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemainderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemainderModelCopyWith<RemainderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemainderModelCopyWith<$Res> {
  factory $RemainderModelCopyWith(
          RemainderModel value, $Res Function(RemainderModel) then) =
      _$RemainderModelCopyWithImpl<$Res, RemainderModel>;
  @useResult
  $Res call({int id, String animeId, String day, DateTime time});
}

/// @nodoc
class _$RemainderModelCopyWithImpl<$Res, $Val extends RemainderModel>
    implements $RemainderModelCopyWith<$Res> {
  _$RemainderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemainderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? animeId = null,
    Object? day = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      animeId: null == animeId
          ? _value.animeId
          : animeId // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemainderModelImplCopyWith<$Res>
    implements $RemainderModelCopyWith<$Res> {
  factory _$$RemainderModelImplCopyWith(_$RemainderModelImpl value,
          $Res Function(_$RemainderModelImpl) then) =
      __$$RemainderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String animeId, String day, DateTime time});
}

/// @nodoc
class __$$RemainderModelImplCopyWithImpl<$Res>
    extends _$RemainderModelCopyWithImpl<$Res, _$RemainderModelImpl>
    implements _$$RemainderModelImplCopyWith<$Res> {
  __$$RemainderModelImplCopyWithImpl(
      _$RemainderModelImpl _value, $Res Function(_$RemainderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemainderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? animeId = null,
    Object? day = null,
    Object? time = null,
  }) {
    return _then(_$RemainderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      animeId: null == animeId
          ? _value.animeId
          : animeId // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemainderModelImpl implements _RemainderModel {
  _$RemainderModelImpl(
      {required this.id,
      required this.animeId,
      this.day = 'Unknown day',
      required this.time});

  factory _$RemainderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemainderModelImplFromJson(json);

  @override
  final int id;
  @override
  final String animeId;
  @override
  @JsonKey()
  final String day;
  @override
  final DateTime time;

  @override
  String toString() {
    return 'RemainderModel(id: $id, animeId: $animeId, day: $day, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemainderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.animeId, animeId) || other.animeId == animeId) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, animeId, day, time);

  /// Create a copy of RemainderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemainderModelImplCopyWith<_$RemainderModelImpl> get copyWith =>
      __$$RemainderModelImplCopyWithImpl<_$RemainderModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemainderModelImplToJson(
      this,
    );
  }
}

abstract class _RemainderModel implements RemainderModel {
  factory _RemainderModel(
      {required final int id,
      required final String animeId,
      final String day,
      required final DateTime time}) = _$RemainderModelImpl;

  factory _RemainderModel.fromJson(Map<String, dynamic> json) =
      _$RemainderModelImpl.fromJson;

  @override
  int get id;
  @override
  String get animeId;
  @override
  String get day;
  @override
  DateTime get time;

  /// Create a copy of RemainderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemainderModelImplCopyWith<_$RemainderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
