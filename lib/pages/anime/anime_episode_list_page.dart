import 'package:firebase_remainder_app/components/anime_episode_card.dart';
import 'package:firebase_remainder_app/components/anime_episode_main_card.dart';
import 'package:firebase_remainder_app/controllers/anime_controller.dart';
import 'package:firebase_remainder_app/utils/local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AnimeEpisodeListPage extends StatelessWidget {
  const AnimeEpisodeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    AnimeController _animeController = Get.find();

    final TextEditingController _animeIdController = TextEditingController();
    final TextEditingController _animeImageController = TextEditingController();
    final TextEditingController _dateTimeController = TextEditingController();

    void _showAddReminderDialog(String animeId, String animeImage) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          _animeIdController.text = animeId;
          _animeImageController.text = animeImage;

          // Initialize datetime controller with current datetime
          _dateTimeController.text = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

          return AlertDialog(
            title: const Text('Add Reminder'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _animeIdController,
                    decoration: const InputDecoration(
                      labelText: 'Anime ID',
                      hintText: 'Enter Anime ID',
                    ),
                    readOnly: true, // Pre-fill with anime ID
                  ),

                  const SizedBox(height: 16),
                  TextField(
                    controller: _dateTimeController,
                    decoration: const InputDecoration(
                      labelText: 'Reminder Date and Time',
                      hintText: 'Select Reminder Date and Time',
                    ),
                    onTap: () async {
                      // Show datetime picker
                      DateTime? pickedDateTime = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );

                      if (pickedDateTime != null) {
                        // If date is selected, show time picker
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (pickedTime != null) {
                          // Combine date and time
                          DateTime finalDateTime = DateTime(
                            pickedDateTime.year,
                            pickedDateTime.month,
                            pickedDateTime.day,
                            pickedTime.hour,
                            pickedTime.minute,
                          );

                          // Update the controller with formatted datetime
                          _dateTimeController.text = DateFormat('yyyy-MM-dd HH:mm').format(finalDateTime);
                        }
                      }
                    },
                    readOnly: true,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_dateTimeController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select a date and time')),
                    );
                    return;
                  }

                  // Parse the scheduled time
                  DateTime? scheduledTime;
                  try {
                    scheduledTime = DateFormat('yyyy-MM-dd HH:mm').parse(_dateTimeController.text);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid date and time format')),
                    );
                    return;
                  }

                  // Schedule the notification
                  LocalNotifications.setScheduleNotification(
                    title: "Reminder",
                    body: "Watch ${_animeIdController.text} now!",
                    scheduledTime: scheduledTime,
                    imageUrl: _animeImageController.text,
                    payload: _animeIdController.text,
                  );


                  Navigator.of(context).pop();
                },
                child: const Text('Submit'),
              ),

            ],
          );
        },
      );
    }
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
                child: AnimeEpisodeMainCard(
                  imageUrl: anime.image,
                  title: anime.title,
                  genre: anime.genres.join(', '),
                  totalEpisodes: anime.totalEpisodes.toString(),
                  rating: '4.4', // Add rating field if available
                  description: anime.description,
                  onTap: () {
                    // Show dialog when main card is tapped
                    _showAddReminderDialog(anime.id, anime.image);
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
                    print(anime.id);
                  },
                  thumbnailUrl: anime.image,
                );
              }).toList(),
            ],
          ),
        );
      }),
    );
  }
}