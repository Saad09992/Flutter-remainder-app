// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_ep_link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnimeEpLinkModel _$AnimeEpLinkModelFromJson(Map<String, dynamic> json) {
  return _AnimeEpLinkModel.fromJson(json);
}

/// @nodoc
mixin _$AnimeEpLinkModel {
  Map<String, String> get headers => throw _privateConstructorUsedError;
  List<Source> get sources => throw _privateConstructorUsedError;
  String get download => throw _privateConstructorUsedError;

  /// Serializes this AnimeEpLinkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimeEpLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimeEpLinkModelCopyWith<AnimeEpLinkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeEpLinkModelCopyWith<$Res> {
  factory $AnimeEpLinkModelCopyWith(
          AnimeEpLinkModel value, $Res Function(AnimeEpLinkModel) then) =
      _$AnimeEpLinkModelCopyWithImpl<$Res, AnimeEpLinkModel>;
  @useResult
  $Res call(
      {Map<String, String> headers, List<Source> sources, String download});
}

/// @nodoc
class _$AnimeEpLinkModelCopyWithImpl<$Res, $Val extends AnimeEpLinkModel>
    implements $AnimeEpLinkModelCopyWith<$Res> {
  _$AnimeEpLinkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimeEpLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headers = null,
    Object? sources = null,
    Object? download = null,
  }) {
    return _then(_value.copyWith(
      headers: null == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      sources: null == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<Source>,
      download: null == download
          ? _value.download
          : download // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeEpLinkModelImplCopyWith<$Res>
    implements $AnimeEpLinkModelCopyWith<$Res> {
  factory _$$AnimeEpLinkModelImplCopyWith(_$AnimeEpLinkModelImpl value,
          $Res Function(_$AnimeEpLinkModelImpl) then) =
      __$$AnimeEpLinkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, String> headers, List<Source> sources, String download});
}

/// @nodoc
class __$$AnimeEpLinkModelImplCopyWithImpl<$Res>
    extends _$AnimeEpLinkModelCopyWithImpl<$Res, _$AnimeEpLinkModelImpl>
    implements _$$AnimeEpLinkModelImplCopyWith<$Res> {
  __$$AnimeEpLinkModelImplCopyWithImpl(_$AnimeEpLinkModelImpl _value,
      $Res Function(_$AnimeEpLinkModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnimeEpLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headers = null,
    Object? sources = null,
    Object? download = null,
  }) {
    return _then(_$AnimeEpLinkModelImpl(
      headers: null == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      sources: null == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<Source>,
      download: null == download
          ? _value.download
          : download // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimeEpLinkModelImpl implements _AnimeEpLinkModel {
  _$AnimeEpLinkModelImpl(
      {required final Map<String, String> headers,
      required final List<Source> sources,
      required this.download})
      : _headers = headers,
        _sources = sources;

  factory _$AnimeEpLinkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimeEpLinkModelImplFromJson(json);

  final Map<String, String> _headers;
  @override
  Map<String, String> get headers {
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headers);
  }

  final List<Source> _sources;
  @override
  List<Source> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  @override
  final String download;

  @override
  String toString() {
    return 'AnimeEpLinkModel(headers: $headers, sources: $sources, download: $download)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeEpLinkModelImpl &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            (identical(other.download, download) ||
                other.download == download));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_headers),
      const DeepCollectionEquality().hash(_sources),
      download);

  /// Create a copy of AnimeEpLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeEpLinkModelImplCopyWith<_$AnimeEpLinkModelImpl> get copyWith =>
      __$$AnimeEpLinkModelImplCopyWithImpl<_$AnimeEpLinkModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimeEpLinkModelImplToJson(
      this,
    );
  }
}

abstract class _AnimeEpLinkModel implements AnimeEpLinkModel {
  factory _AnimeEpLinkModel(
      {required final Map<String, String> headers,
      required final List<Source> sources,
      required final String download}) = _$AnimeEpLinkModelImpl;

  factory _AnimeEpLinkModel.fromJson(Map<String, dynamic> json) =
      _$AnimeEpLinkModelImpl.fromJson;

  @override
  Map<String, String> get headers;
  @override
  List<Source> get sources;
  @override
  String get download;

  /// Create a copy of AnimeEpLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimeEpLinkModelImplCopyWith<_$AnimeEpLinkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Source _$SourceFromJson(Map<String, dynamic> json) {
  return _Source.fromJson(json);
}

/// @nodoc
mixin _$Source {
  String get url => throw _privateConstructorUsedError;
  bool get isM3U8 => throw _privateConstructorUsedError;
  String get quality => throw _privateConstructorUsedError;

  /// Serializes this Source to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SourceCopyWith<Source> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceCopyWith<$Res> {
  factory $SourceCopyWith(Source value, $Res Function(Source) then) =
      _$SourceCopyWithImpl<$Res, Source>;
  @useResult
  $Res call({String url, bool isM3U8, String quality});
}

/// @nodoc
class _$SourceCopyWithImpl<$Res, $Val extends Source>
    implements $SourceCopyWith<$Res> {
  _$SourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? isM3U8 = null,
    Object? quality = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isM3U8: null == isM3U8
          ? _value.isM3U8
          : isM3U8 // ignore: cast_nullable_to_non_nullable
              as bool,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceImplCopyWith<$Res> implements $SourceCopyWith<$Res> {
  factory _$$SourceImplCopyWith(
          _$SourceImpl value, $Res Function(_$SourceImpl) then) =
      __$$SourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, bool isM3U8, String quality});
}

/// @nodoc
class __$$SourceImplCopyWithImpl<$Res>
    extends _$SourceCopyWithImpl<$Res, _$SourceImpl>
    implements _$$SourceImplCopyWith<$Res> {
  __$$SourceImplCopyWithImpl(
      _$SourceImpl _value, $Res Function(_$SourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? isM3U8 = null,
    Object? quality = null,
  }) {
    return _then(_$SourceImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isM3U8: null == isM3U8
          ? _value.isM3U8
          : isM3U8 // ignore: cast_nullable_to_non_nullable
              as bool,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourceImpl implements _Source {
  _$SourceImpl(
      {required this.url, required this.isM3U8, required this.quality});

  factory _$SourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceImplFromJson(json);

  @override
  final String url;
  @override
  final bool isM3U8;
  @override
  final String quality;

  @override
  String toString() {
    return 'Source(url: $url, isM3U8: $isM3U8, quality: $quality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.isM3U8, isM3U8) || other.isM3U8 == isM3U8) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, isM3U8, quality);

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      __$$SourceImplCopyWithImpl<_$SourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceImplToJson(
      this,
    );
  }
}

abstract class _Source implements Source {
  factory _Source(
      {required final String url,
      required final bool isM3U8,
      required final String quality}) = _$SourceImpl;

  factory _Source.fromJson(Map<String, dynamic> json) = _$SourceImpl.fromJson;

  @override
  String get url;
  @override
  bool get isM3U8;
  @override
  String get quality;

  /// Create a copy of Source
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SourceImplCopyWith<_$SourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
