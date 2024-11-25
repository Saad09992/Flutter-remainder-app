import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_ep_model.freezed.dart';
part 'anime_ep_model.g.dart';

@freezed
class AnimeEpisodeModel with _$AnimeEpisodeModel {
  factory AnimeEpisodeModel({
    required String id,
    required String title,
    required List<String> genres,
    required int totalEpisodes,
    required String image,
    required String description,
    required List<Episode> episodes,
  }) = _AnimeEpisodeModel;

  factory AnimeEpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeEpisodeModelFromJson(json);
}

@freezed
class Episode with _$Episode {
  factory Episode({
    required String id,
    required int number,
    required String url,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}
