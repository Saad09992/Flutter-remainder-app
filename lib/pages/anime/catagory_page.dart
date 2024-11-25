import 'package:firebase_remainder_app/controllers/anime_controller.dart';
import 'package:firebase_remainder_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_remainder_app/components/catagory_card.dart';
import 'package:firebase_remainder_app/components/custom_appbar.dart';
import 'package:firebase_remainder_app/components/drawer.dart';

class CatagoryPage extends StatelessWidget {
  const CatagoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimeController _animeController = AnimeController();
    return Scaffold(
      appBar: const CustomAppBar(title: "Select Catagory"),
      drawer: const CustomDrawer(),
      body: ListView(
        children: [
          CategoryCard(
            imagePath: Assets.images.dragonPic.path,
            title: 'Dragon',
            description: 'Anime related to dragons.',
            onTap: () {
              _animeController.selectCatagory('dragon');
            },
          ),
          CategoryCard(
            imagePath: Assets.images.demon.path,
            title: 'Demon',
            description: 'Anime related to demon.',
            onTap: () {
              _animeController.selectCatagory('demon');
            },
          ),
          CategoryCard(
            imagePath: Assets.images.fighting.path,
            title: 'Fighting',
            description: 'Anime related to fightig.',
            onTap: () {
              _animeController.selectCatagory('fighting');
            },
          ),
        ],
      ),
    );
  }
}
