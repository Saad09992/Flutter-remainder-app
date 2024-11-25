// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimeModelImpl _$$AnimeModelImplFromJson(Map<String, dynamic> json) =>
    _$AnimeModelImpl(
      id: json['id'] as String? ?? 'Unknown ID',
      title: json['title'] as String? ?? 'Unknown title',
      image: json['image'] as String? ?? '',
      releaseDate: json['releaseDate'] as String? ?? 'Unknown release date',
    );

Map<String, dynamic> _$$AnimeModelImplToJson(_$AnimeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'releaseDate': instance.releaseDate,
    };
