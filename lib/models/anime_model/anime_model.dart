import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_model.freezed.dart';
part 'anime_model.g.dart';

@freezed
class AnimeModel with _$AnimeModel {
  factory AnimeModel({
    @Default('Unknown ID') String id,
    @Default('Unknown title') String title,
    @Default('') String image,
    @Default('Unknown release date') String releaseDate,
  }) = _AnimeModel;

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);
}
