// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remainder_app/controllers/theme_controller.dart';
import 'package:firebase_remainder_app/utils/init_dependencies.dart';
import './utils/routes/routes.dart';
import './utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
