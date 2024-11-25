import 'package:firebase_remainder_app/components/anime_episode_card.dart';
import 'package:firebase_remainder_app/components/episode_anime_card.dart';
import 'package:firebase_remainder_app/controllers/anime_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeEpisodeListPage extends StatelessWidget {
  const AnimeEpisodeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the AnimeController
    AnimeController _animeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 52, 52),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 54, 52, 52),
      body: Obx(() {
        // Check if there is data available
        if (_animeController.animeEpisodeModel.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Get the first AnimeEpisodeModel for display
        final anime = _animeController.animeEpisodeModel.first;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display main Anime details
              Container(
                height: 300,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: EpisodeAnimeCard(
                  imageUrl: anime.image,
                  title: anime.title,
                  genre: anime.genres.join(', '),
                  totalEpisodes: anime.totalEpisodes.toString(),
                  rating: '4.4', // Add rating field if available
                  description: anime.description,
                  onTap: () {
                    // Action when card is tapped
                  },
                ),
              ),
              Divider(
                color: const Color.fromARGB(255, 83, 81, 81),
                thickness: 1,
                height: 1,
              ),
              const SizedBox(height: 12),
              // Display episodes
              ...anime.episodes.map((episode) {
                return AnimeEpisodeCard(
                  episodeNumber: episode.number.toString(),
                  episodeTitle: 'Episode ${episode.number}',
                  onPlay: () {
                    // Play action for the episode
                  },
                  thumbnailUrl: anime
                      .image, // Use the same image or a specific episode thumbnail
                );
              }).toList(),
            ],
          ),
        );
      }),
    );
  }
}
