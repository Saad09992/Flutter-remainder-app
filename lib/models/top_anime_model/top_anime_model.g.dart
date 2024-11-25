// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopAnimeModelImpl _$$TopAnimeModelImplFromJson(Map<String, dynamic> json) =>
    _$TopAnimeModelImpl(
      id: json['id'] as String? ?? 'Unknown ID',
      title: json['title'] as String? ?? 'Unknown title',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$$TopAnimeModelImplToJson(_$TopAnimeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };
