// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_ep_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimeEpLinkModelImpl _$$AnimeEpLinkModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AnimeEpLinkModelImpl(
      headers: Map<String, String>.from(json['headers'] as Map),
      sources: (json['sources'] as List<dynamic>)
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      download: json['download'] as String,
    );

Map<String, dynamic> _$$AnimeEpLinkModelImplToJson(
        _$AnimeEpLinkModelImpl instance) =>
    <String, dynamic>{
      'headers': instance.headers,
      'sources': instance.sources,
      'download': instance.download,
    };

_$SourceImpl _$$SourceImplFromJson(Map<String, dynamic> json) => _$SourceImpl(
      url: json['url'] as String,
      isM3U8: json['isM3U8'] as bool,
      quality: json['quality'] as String,
    );

Map<String, dynamic> _$$SourceImplToJson(_$SourceImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'isM3U8': instance.isM3U8,
      'quality': instance.quality,
    };
