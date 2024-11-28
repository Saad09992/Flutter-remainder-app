import 'package:firebase_remainder_app/pages/anime/anime_display_page.dart';
import 'package:firebase_remainder_app/pages/anime/anime_episode_list_page.dart';
import 'package:firebase_remainder_app/pages/anime/catagory_page.dart';
import 'package:firebase_remainder_app/pages/anime/video_player_page.dart';
import 'package:firebase_remainder_app/pages/home_page.dart';
import 'package:firebase_remainder_app/pages/auth/register_page.dart';
import 'package:firebase_remainder_app/pages/auth/sign_in_page.dart';
import 'package:firebase_remainder_app/pages/remainder_management_page.dart';
import 'package:firebase_remainder_app/pages/testing/testing_add_page.dart';
import 'package:firebase_remainder_app/pages/testing/testing_page.dart';
import 'package:firebase_remainder_app/pages/testing/testing_video_page.dart';
import 'package:firebase_remainder_app/utils/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import './routes_name.dart';

class Routes {
  // generateRoute method
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // the settings contain the route and displays the page accrdingly
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegisterPage());
      case RoutesName.widgetTree:
        return MaterialPageRoute(
            builder: (BuildContext context) => const WidgetTree());
      case RoutesName.signin:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignInPage());
      case RoutesName.testing:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TestingPage());
      case RoutesName.testingAdd:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TestingAddPage());
      case RoutesName.catagoryPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CatagoryPage());
      // display this if route is invalid
      case RoutesName.animeDisplayPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AnimeDisplayPage());
      case RoutesName.AnimeEpisodeListPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AnimeEpisodeListPage());
      case RoutesName.testingVideoPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const  VideoApp());
        case RoutesName.remainderManagementPage:
        return MaterialPageRoute(
            builder: (BuildContext context) => const  RemainderManagementPage());
      // display this if route is invalid
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
