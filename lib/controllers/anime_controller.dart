// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, invalid_use_of_protected_member

import 'package:firebase_remainder_app/components/anime_episode_card.dart';
import 'package:firebase_remainder_app/models/anime_episodes_model/anime_ep_model.dart';
import 'package:firebase_remainder_app/models/anime_model/anime_model.dart';
import 'package:firebase_remainder_app/network/network_api_service.dart';
import 'package:firebase_remainder_app/utils/routes/routes_name.dart';
import 'package:firebase_remainder_app/utils/urls.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../models/top_anime_model/top_anime_model.dart';

class AnimeController extends GetxController {
  final NetworkApiService _apiService = NetworkApiService();

  final RxString _type = ''.obs;

  final RxList<AnimeModel> _animeModel = <AnimeModel>[].obs;
  get animeModel => _animeModel.value;

  final RxList<TopAnimeModel> _topAnimeModel = <TopAnimeModel>[].obs;
  get topAnimeModel => _topAnimeModel.value;

  final RxList<AnimeEpisodeModel> _animeEpisodeModel =
      <AnimeEpisodeModel>[].obs;
  get animeEpisodeModel => _animeEpisodeModel.value;

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
        _topAnimeModel.value = animeList; // Assuming _animeModel is a List.
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getSpecificAnimeData(String id) async {
    try {
      // Fetch specific anime data from the API
      final res = await _apiService
          .getGetApiResponse('${Urls.getSpecificAnimeData}$id');

      if (res is Map<String, dynamic>) {
        // Parse data into AnimeEpisodeModel
        final animeEpisode = AnimeEpisodeModel.fromJson(res);

        // Update the reactive list
        _animeEpisodeModel.clear(); // Clear previous data
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

  void selectCatagory(String type) {
    try {
      _type.value = type;
      Get.offAllNamed(RoutesName.animeDisplayPage);
    } catch (e) {
      rethrow;
    }
  }
}
