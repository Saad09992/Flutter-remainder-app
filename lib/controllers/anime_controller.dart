// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, invalid_use_of_protected_member

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_remainder_app/models/anime_ep_link_model/anime_ep_link_model.dart';
import 'package:firebase_remainder_app/models/anime_episodes_model/anime_ep_model.dart';
import 'package:firebase_remainder_app/models/anime_model/anime_model.dart';
import 'package:firebase_remainder_app/network/network_api_service.dart';
import 'package:firebase_remainder_app/utils/routes/routes_name.dart';
import 'package:firebase_remainder_app/utils/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../models/top_anime_model/top_anime_model.dart';
import '../pages/anime/video_player_page.dart';

class AnimeController extends GetxController {
  final NetworkApiService _apiService = NetworkApiService();
  final _firebaseDatabase = FirebaseDatabase.instance.ref();

  final RxString _type = ''.obs;

  final RxList<AnimeModel> _animeModel = <AnimeModel>[].obs;
  get animeModel => _animeModel.value;

  // final Rx<AnimeEpLinkModel?> _animeEpLinkModel = Rx<AnimeEpLinkModel?>(null);
  // get animeEpLinkModel => _animeEpLinkModel.value;

  final RxString _selectedQuality = RxString('360p'); // Default quality
  get selectedQuality => _selectedQuality.value;

  final Rx<AnimeEpLinkModel> _animeEpLinkModel = Rx<AnimeEpLinkModel>(
    AnimeEpLinkModel(
      headers: {},  // Empty map for headers
      sources: [],  // Empty list for sources
      download: '', // Empty string for download link
    ),
  );

  get animeEpLinkModel => _animeEpLinkModel.value;

  final RxList<TopAnimeModel> _topAnimeModel = <TopAnimeModel>[].obs;
  get topAnimeModel => _topAnimeModel.value;

  final RxList<AnimeEpisodeModel> _animeEpisodeModel =
      <AnimeEpisodeModel>[].obs;
  get animeEpisodeModel => _animeEpisodeModel.value;

  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> setRemainder(String animeId, String dateTime)async{
    try{
      final uid = await _storage.read(key: 'user_id');
      await _firebaseDatabase.child('remainders/$uid/$animeId').set(dateTime).then((val){
        print("data saved successfully");
      });
    }catch(e){
      rethrow;
    }
  }

  Future<void> getAllAnimeData() async {
    try {
      final response = await _apiService.getGetApiResponse(Urls.getDragonAnime);
      if (response is Map<String, dynamic> && response.containsKey('results')) {
        final List<dynamic> results = response['results'];
        final animeList = results
            .map((data) => AnimeModel.fromJson(data as Map<String, dynamic>))
            .toList();
        _animeModel.value = animeList; // Assuming _animeModel is a List.
      }
      getTopAnimeData();
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      rethrow;
    }
  }

  Future<void> getAnimeTypeData(String type) async {
    if (type == 'dragon') {
      final res = await _apiService.getGetApiResponse(Urls.getDragonAnime);
      if (kDebugMode) {
        print('Dragon: ${res.toString()}');
      }
    } else if (type == 'demon') {
      final res = await _apiService.getGetApiResponse(Urls.getDemonAnime);
      if (kDebugMode) {
        print('Demon: ${res.toString()}');
      }
    } else if (type == 'fighting') {
      final res = await _apiService.getGetApiResponse(Urls.getfightingAnime);
      if (kDebugMode) {
        print('Fighting: ${res.toString()}');
      }
    } else {
      if (kDebugMode) {
        print('This catagory of anime is not avaialble');
      }
    }
  }

  Future<void> getTopAnimeData() async {
    try {
      final res = await _apiService.getGetApiResponse(Urls.getTopAnime);
      if (res is Map<String, dynamic> && res.containsKey('results')) {
        final List<dynamic> results = res['results'];
        final animeList = results
            .map((data) => TopAnimeModel.fromJson(data as Map<String, dynamic>))
            .toList();
        _topAnimeModel.value = animeList;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getSpecificAnimeData(String id) async {
    try {
      final res = await _apiService
          .getGetApiResponse('${Urls.getSpecificAnimeData}$id');
      if (res is Map<String, dynamic>) {
        final animeEpisode = AnimeEpisodeModel.fromJson(res);

        _animeEpisodeModel.clear();
        _animeEpisodeModel.add(animeEpisode);
      } else {
        if (kDebugMode) {
          print('Unexpected response format: $res');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching specific anime data: $e');
      }
      rethrow;
    }
  }

  Future<void> getEpisodeStreamingLink(String id, BuildContext context) async {
    try {
      final res = await _apiService.getGetApiResponse('${Urls.getStreamingLink}$id?server=gogocdn');

      final episodeLink = AnimeEpLinkModel.fromJson(res);

      _animeEpLinkModel.value = episodeLink;

      final filteredSources = episodeLink.sources
          .where((source) => source.quality == selectedQuality)
          .toList();

      if (filteredSources.isNotEmpty) {
        final selectedSource = filteredSources[0];
        print('Selected URL: ${selectedSource.url}');
        print("Available Sources: ${animeEpLinkModel.sources}");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(), // Pass the selected URL to the video player
          ),
        );
      } else {
        print('No sources available for the selected quality');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching episode streaming link: $e');
      }
      rethrow;
    }
  }

  void selectQuality(String quality) {
    print(quality);
    _selectedQuality.value = quality;
    update();
  }

  String getUrlForSelectedQuality() {
    try {
      return animeEpLinkModel.sources
          .firstWhere((source) => source.quality == selectedQuality)
          .url;
    } catch (e) {
      print('Quality not found: $e');
      return '';
    }
  }

  void selectCatagory(String type) {
    try {
      _type.value = type;
      Get.offAllNamed(RoutesName.animeDisplayPage);
    } catch (e) {
      rethrow;
    }
  }

}
