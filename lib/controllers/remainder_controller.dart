import 'dart:convert';

import 'package:firebase_remainder_app/models/remainder_model/remainder_model.dart';
import 'package:firebase_remainder_app/utils/local_notifications.dart';
import 'package:get/get.dart';

class RemainderController extends GetxController {
  // List to store all remainder models
  RxList<RemainderModel> _remainderModels = <RemainderModel>[].obs;
  get remainderModel => _remainderModels.value;


  Future<void> getRemaindersData() async {
    try {
      _remainderModels.clear();
      final List data = await LocalNotifications.getAllActiveNotifications();

      for (var i in data) {
        final id = i.id;
        final String payloadString = i.payload;

        // Print the raw payload for debugging
        print('Raw payload: $payloadString');

        Map<String, dynamic>? payloadMap;

        try {
          // Attempt to decode as JSON
          payloadMap = json.decode(payloadString);
        } catch (e) {
          print('Payload is not a valid JSON: $payloadString');
          continue; // Skip this iteration if not JSON
        }

        // Ensure payloadMap is not null
        if (payloadMap == null) {
          print('Skipping notification with invalid payload.');
          continue;
        }

        // Extract fields from the payload
        final animeId = payloadMap['animeId'] ?? '';
        final day = payloadMap['day'] ?? 'Unknown day';
        final timeString = payloadMap['scheduledTime'];
        DateTime time;

        try {
          time = DateTime.parse(timeString);
        } catch (e) {
          print('Invalid time format in payload: $timeString');
          continue; // Skip this iteration if time is invalid
        }

        // Create a RemainderModel instance
        final remainderModel = RemainderModel(
          id: id,
          animeId: animeId,
          day: day,
          time: time,
        );

        // Add the model to the list
        _remainderModels.add(remainderModel);

      }
    } catch (error) {
      print('Error fetching remainders: $error');
      rethrow;
    }
  }

  Future<void> deleteRemainder(int id) async {
    try {
      // Cancel the notification
      await LocalNotifications.cancelNotification(id);

      // Remove the remainder from the list
      _remainderModels.removeWhere((remainder) => remainder.id == id);

      // Update the list
      update();
    } catch (error) {
      Get.snackbar("Error", "Failed to delete remainder");
    }
  }

}
