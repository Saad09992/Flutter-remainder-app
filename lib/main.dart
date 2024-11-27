// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remainder_app/controllers/theme_controller.dart';
import 'package:firebase_remainder_app/utils/init_dependencies.dart';
import 'package:firebase_remainder_app/utils/local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import './utils/routes/routes.dart';
import './utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;


Future<void> requestExactAlarmPermission() async {
  if (await Permission.scheduleExactAlarm.status != PermissionStatus.granted) {
    PermissionStatus status = await Permission.scheduleExactAlarm.request();
    if (status != PermissionStatus.granted) {
      // Handle permission denial
      print('Exact alarm permission not granted');
      return;
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  await Firebase.initializeApp();
  await requestExactAlarmPermission();
  tz.initializeTimeZones();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.put(ThemeController());

    return GetMaterialApp(
      initialBinding: InitDependencies(),
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: _themeController.currentTheme,
      initialRoute: RoutesName.widgetTree,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
