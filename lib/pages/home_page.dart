import 'package:firebase_remainder_app/components/custom_appbar.dart';
import 'package:firebase_remainder_app/components/drawer.dart';
import 'package:firebase_remainder_app/controllers/anime_controller.dart';
import 'package:firebase_remainder_app/gen/assets.gen.dart';
import 'package:firebase_remainder_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AnimeController _animeController = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(title: "Home"),
      drawer: const CustomDrawer(),
      body: Stack(
        children: [
          // Anime background image covering the full screen
          Positioned.fill(
            child: Image.asset(
              Assets.images.dragon.path,
              fit: BoxFit.cover,
            ),
          ),
          // Get Started button at the bottom
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  _animeController.getAllAnimeData().then((val) {
                    Navigator.pushNamed(context, RoutesName.animeDisplayPage);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.black.withOpacity(0.7), // Semi-transparent button
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
