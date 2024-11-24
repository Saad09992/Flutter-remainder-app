// ignore_for_file: prefer_const_constructors

import 'package:firebase_remainder_app/components/anime_card.dart';
import 'package:firebase_remainder_app/components/custom_appbar.dart';
import 'package:firebase_remainder_app/components/drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimeDisplayPage extends StatefulWidget {
  const AnimeDisplayPage({super.key});

  @override
  State<AnimeDisplayPage> createState() => _AnimeDisplayPageState();
}

class _AnimeDisplayPageState extends State<AnimeDisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Anime"),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          AnimeCard(
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/en/c/c7/Solo_Leveling_1_cover.jpg',
            title: 'Solo Leveling',
            duration: '24 min per episode',
            episodes: 12,
            onTap: () {
              print('Solo Leveling Clicked');
            },
          ),
          AnimeCard(
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/en/a/a9/NarutoCover.jpg',
            title: 'Naruto',
            duration: '23 min per episode',
            episodes: 220,
            onTap: () {
              print('Naruto Clicked');
            },
          ),
        ],
      ),
    );
  }
}
