
import 'dart:convert';
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

  static  Future<void> cancelNotification(int id)async{
    await flutterLocalNotificationsPlugin.cancel(id).then((val){
      print('$id deleted succesfully');
    });
  }

  static Future<void> cancelAllNotifications()async{
    await flutterLocalNotificationsPlugin.cancelAll().then((val){print('All deleteded');});
  }

  static Future<List> getAllActiveNotifications()async{
    try{
      final List<PendingNotificationRequest> activeNotifications = await flutterLocalNotificationsPlugin.pendingNotificationRequests();
      return activeNotifications;
    }catch (error){rethrow;}
  }

  static Future<void> setScheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledTime,
    required String day,
    String? animeId,
    String? imageUrl,
  }) async {
    try {
      print('day: $day');
      print('Current time: ${DateTime.now()}');
      print('Scheduled time: $scheduledTime');

      // Initialize timezone
      tz.initializeTimeZones();
      final pakistanTimezone = tz.getLocation('Asia/Karachi');
      tz.setLocalLocation(pakistanTimezone);

      // Convert the scheduled time to a weekly recurring schedule
      final tz.TZDateTime firstScheduleDate = tz.TZDateTime.from(
        scheduledTime,
        pakistanTimezone,
      );

      String payload = json.encode({
        'day': day,
        'scheduledTime': scheduledTime.toIso8601String(),
        'animeId': animeId,
        'isRepeating': true
      });

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
        'precise_weekly_notification_channel',
        'Precise Weekly Notifications',
        channelDescription: 'Weekly notifications with precise timing',
        importance: Importance.high,
        priority: Priority.high,
        styleInformation: bigPictureStyle,
      );

      final NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
      );

      int notificationId = DateTime.now().millisecondsSinceEpoch.remainder(100000);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        title,
        body,
        firstScheduleDate,
        notificationDetails,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exact,
        payload: payload,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime, // This makes the notification repeat weekly
      );

      print('Weekly notification scheduled successfully for: $firstScheduleDate');
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