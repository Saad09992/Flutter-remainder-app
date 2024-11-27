import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DbController extends GetxController {
  final _firebaseDatabase = FirebaseDatabase.instance.ref();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future setRemainder(String animeId, String time) async {
    try {
      final uid = await _storage.read(key: 'user_id');
      final res = await _firebaseDatabase
          .child('remainders/$uid/$animeId/time')
          .set(time)
          .then((val) {
        if (kDebugMode) {
          print('Data entered successfull');
        }
      }).onError(
        (error, stackTrace) {
          if (kDebugMode) {
            print(error.toString());
          }
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
