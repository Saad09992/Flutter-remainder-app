// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remainder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemainderModelImpl _$$RemainderModelImplFromJson(Map<String, dynamic> json) =>
    _$RemainderModelImpl(
      id: (json['id'] as num).toInt(),
      animeId: json['animeId'] as String,
      day: json['day'] as String? ?? 'Unknown day',
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$RemainderModelImplToJson(
        _$RemainderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'animeId': instance.animeId,
      'day': instance.day,
      'time': instance.time.toIso8601String(),
    };
