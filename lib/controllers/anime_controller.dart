import 'package:firebase_remainder_app/network/network_api_service.dart';
import 'package:firebase_remainder_app/utils/routes/routes_name.dart';
import 'package:firebase_remainder_app/utils/urls.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AnimeController extends GetxController {
  final NetworkApiService _apiService = NetworkApiService();
  final RxString _type = ''.obs;

  Future<void> getAnimeData(String type) async {
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

  void selectCatagory(String type) {
    try {
      _type.value = type;
      Get.offAllNamed(RoutesName.animeDisplayPage);
    } catch (e) {
      rethrow;
    }
  }
}
