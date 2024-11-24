import 'package:firebase_remainder_app/controllers/anime_controller.dart';
import 'package:firebase_remainder_app/utils/routes/routes_name.dart';
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
            imagePath: 'assets/images/dragon_pic.jpg',
            title: 'Dragon',
            description: 'Anime related to dragons.',
            onTap: () {
              _animeController.selectCatagory('dragon');
            },
          ),
          CategoryCard(
            imagePath: 'assets/images/demon.jpg',
            title: 'Demon',
            description: 'Anime related to demon.',
            onTap: () {
              _animeController.selectCatagory('demon');
            },
          ),
          CategoryCard(
            imagePath: 'assets/images/fighting.jpg',
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
