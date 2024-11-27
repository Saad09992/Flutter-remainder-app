import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_ep_link_model.freezed.dart';
part 'anime_ep_link_model.g.dart';

// Define the model using Freezed
@freezed
class AnimeEpLinkModel with _$AnimeEpLinkModel {
   factory AnimeEpLinkModel({
    required Map<String, String> headers,
    required List<Source> sources,
    required String download,
  }) = _AnimeEpLinkModel;

  factory AnimeEpLinkModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeEpLinkModelFromJson(json);
}

@freezed
class Source with _$Source {
   factory Source({
    required String url,
    required bool isM3U8,
    required String quality,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
