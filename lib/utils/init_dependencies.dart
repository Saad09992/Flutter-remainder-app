import 'package:firebase_remainder_app/controllers/anime_controller.dart';
import 'package:firebase_remainder_app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class InitDependencies extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => AnimeController());
  }
}
