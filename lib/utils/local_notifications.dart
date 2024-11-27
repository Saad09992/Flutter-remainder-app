import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart'as tz;
import 'package:path_provider/path_provider.dart';


class LocalNotifications {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static final onClickNotification = BehaviorSubject<String>();

  static void onTapOnNot(NotificationResponse notificationResponse) {
    // Ensure the payload is not null before adding
    if (notificationResponse.payload != null) {
      onClickNotification.add(notificationResponse.payload!);
    }
  }



  static Future<void> init() async {
    await createNotificationChannel(); // Add this line

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onTapOnNot,
      onDidReceiveBackgroundNotificationResponse: onTapOnNot,
    );
  }

  // Callback for handling notification tap
  static void onNotificationTap(NotificationResponse notificationResponse) {
    // Handle notification tap
    debugPrint('Notification tapped: ${notificationResponse.payload}');
  }

  // Method to show a simple notification
  static Future<void> showSimpleNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    // Android notification details
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'your_channel_id', // Unique channel ID
      'Your Channel Name', // Channel name
      channelDescription: 'Your channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    // Notification details
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    // Show the notification
    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID (can be unique for each notification)
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  static  Future<void> cancelNotification(int id)async{
    await flutterLocalNotificationsPlugin.cancel(id);
  }
  static Future<void> cancelAllNotifications()async{
    await flutterLocalNotificationsPlugin.cancelAll();
  }



  static Future<void> setScheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledTime,
    String? payload,
    String? imageUrl, // Image URL
  }) async {
    try {
      // Validate scheduled time is in the future
      if (scheduledTime.isBefore(DateTime.now())) {
        print('Error: Scheduled time must be in the future');
        return;
      }

      // Initialize timezone
      tz.initializeTimeZones();
      final pakistanTimezone = tz.getLocation('Asia/Karachi');
      tz.setLocalLocation(pakistanTimezone);

      final tz.TZDateTime scheduleDate = tz.TZDateTime.from(
        scheduledTime,
        pakistanTimezone,
      );

      String? localImagePath;
      if (imageUrl != null && imageUrl.isNotEmpty) {
        // Generate a unique file name
        final String uniqueFileName =
            'notification_image_${DateTime.now().millisecondsSinceEpoch}.jpg';

        // Download the image
        final http.Response response = await http.get(Uri.parse(imageUrl));
        if (response.statusCode == 200) {
          final Directory tempDir = await getTemporaryDirectory();
          final File file = File('${tempDir.path}/$uniqueFileName');
          await file.writeAsBytes(response.bodyBytes);
          localImagePath = file.path; // Save the local path
        } else {
          print('Failed to download image: ${response.statusCode}');
        }
      }

      // Configure BigPictureStyleInformation if the image is downloaded
      final BigPictureStyleInformation? bigPictureStyle = (localImagePath != null)
          ? BigPictureStyleInformation(
        FilePathAndroidBitmap(localImagePath),
        largeIcon: FilePathAndroidBitmap(localImagePath),
        contentTitle: '<b>$title</b>',
        summaryText: body,
        htmlFormatContentTitle: true,
        htmlFormatSummaryText: true,
      )
          : null;

      // Configure Android notification details
      final AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
        'precise_notification_channel',
        'Precise Notifications',
        channelDescription: 'Notifications with precise timing',
        importance: Importance.high,
        priority: Priority.high,
        styleInformation: bigPictureStyle, // Attach BigPictureStyle
      );

      final NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
      );

      int notificationId = DateTime.now().millisecondsSinceEpoch.remainder(100000);

      // Schedule the notification
      await flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        title,
        body,
        scheduleDate,
        notificationDetails,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exact,
        payload: payload,
      );

      print('Notification scheduled successfully for: $scheduleDate');
    } catch (e, stackTrace) {
      print('Notification Scheduling Error: $e');
      print('Stack Trace: $stackTrace');
    }
  }




  static Future<void> createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'your_channel_id', // id
      'Your Channel Name', // title
      description: 'Your channel description',
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> requestNotificationPermission() async {
    PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      print('Notification permission granted');
    } else {
      print('Notification permission denied');
    }
  }
}