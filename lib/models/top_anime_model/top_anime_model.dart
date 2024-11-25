import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_anime_model.freezed.dart';
part 'top_anime_model.g.dart';

@freezed
class TopAnimeModel with _$TopAnimeModel {
  factory TopAnimeModel({
    @Default('Unknown ID') String id,
    @Default('Unknown title') String title,
    @Default('') String image,
  }) = _TopAnimeModel;

  factory TopAnimeModel.fromJson(Map<String, dynamic> json) =>
      _$TopAnimeModelFromJson(json);
}
