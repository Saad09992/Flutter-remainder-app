// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:async';

import 'package:firebase_remainder_app/controllers/anime_controller.dart';
import 'package:firebase_remainder_app/models/anime_model/anime_model.dart';
import 'package:firebase_remainder_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:firebase_remainder_app/components/anime_card.dart';
import 'package:firebase_remainder_app/components/anime_carosel_card.dart';
import 'package:get/get.dart';

class AnimeDisplayPage extends StatefulWidget {
  const AnimeDisplayPage({super.key});

  @override
  State<AnimeDisplayPage> createState() => _AnimeDisplayPageState();
}

class _AnimeDisplayPageState extends State<AnimeDisplayPage> {
  AnimeController _animeController = Get.find();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  TextEditingController _searchController = TextEditingController();
  RxList<AnimeModel> _filteredAnime = RxList<AnimeModel>([]);
  bool _isSearchVisible = false;

  @override
  void initState() {
    super.initState();
    _filteredAnime.value = List<AnimeModel>.from(_animeController.animeModel);

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_animeController.topAnimeModel.isNotEmpty) {
        int nextPage =
            ((_currentPage + 1) % _animeController.topAnimeModel.length)
                .toInt();
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });

    _searchController.addListener(_filterAnime);
  }

  @override
  void dispose() {
    _timer.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _filterAnime() {
    String searchTerm = _searchController.text.toLowerCase();
    if (searchTerm.isEmpty) {
      _filteredAnime.value = List<AnimeModel>.from(_animeController.animeModel);
    } else {
      _filteredAnime.value = List<AnimeModel>.from(
        _animeController.animeModel.where((AnimeModel anime) {
          return anime.title.toLowerCase().contains(searchTerm);
        }),
      );
    }
  }

  void _toggleSearchBar() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
      if (!_isSearchVisible) {
        _searchController.clear();
        _filterAnime();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: _isSearchVisible
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search Anime',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close, color: Colors.grey),
                    onPressed: _toggleSearchBar,
                  ),
                ),
              )
            : Text(
                "Now",
                style: TextStyle(color: Colors.black),
              ),
        actions: [
          if (!_isSearchVisible)
            IconButton(
              icon: Icon(Icons.search, color: Colors.grey),
              onPressed: _toggleSearchBar,
            ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 330,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Obx(() {
                  if (_animeController.topAnimeModel.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return PageView.builder(
                    controller: _pageController,
                    itemCount: _animeController.topAnimeModel.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final anime = _animeController.topAnimeModel[index];
                      return AnimeCarouselCard(
                        imageUrl: anime.image,
                        title: anime.title,
                        rating: '4.7',
                        status: 'New episode',
                        onTap: () {
                          print('${anime.id} carousel clicked');
                          _animeController
                              .getSpecificAnimeData(anime.id)
                              .then((val) {
                            Navigator.pushNamed(
                                context, RoutesName.AnimeEpisodeListPage);
                          });
                        },
                      );
                    },
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _animeController.topAnimeModel.length,
                  (index) => Container(
                    width: 7,
                    height: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.amber
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
                height: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'All Anime',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Obx(() => Column(
                    children: _filteredAnime
                        .asMap()
                        .map((index, anime) {
                          return MapEntry(
                            index,
                            AnimeCard(
                              imageUrl: anime.image,
                              title: anime.title,
                              genre: 'Fantasy',
                              rating: '4.4',
                              description: 'Anime related to dragons',
                              onTap: () {
                                print(
                                    '${anime.id} list clicked at index $index');
                                _animeController
                                    .getSpecificAnimeData(anime.id)
                                    .then((val) {
                                  Navigator.pushNamed(
                                      context, RoutesName.AnimeEpisodeListPage);
                                });
                              },
                            ),
                          );
                        })
                        .values
                        .toList(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
