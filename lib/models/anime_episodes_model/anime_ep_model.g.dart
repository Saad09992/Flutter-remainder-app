// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_ep_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimeEpisodeModelImpl _$$AnimeEpisodeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AnimeEpisodeModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      totalEpisodes: (json['totalEpisodes'] as num).toInt(),
      image: json['image'] as String,
      description: json['description'] as String,
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AnimeEpisodeModelImplToJson(
        _$AnimeEpisodeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'genres': instance.genres,
      'totalEpisodes': instance.totalEpisodes,
      'image': instance.image,
      'description': instance.description,
      'episodes': instance.episodes,
    };

_$EpisodeImpl _$$EpisodeImplFromJson(Map<String, dynamic> json) =>
    _$EpisodeImpl(
      id: json['id'] as String,
      number: (json['number'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$$EpisodeImplToJson(_$EpisodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'url': instance.url,
    };
