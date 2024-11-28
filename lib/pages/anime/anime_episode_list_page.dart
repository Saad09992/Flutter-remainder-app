import 'package:firebase_remainder_app/components/anime_episode_card.dart';
import 'package:firebase_remainder_app/components/anime_episode_main_card.dart';
import 'package:firebase_remainder_app/controllers/anime_controller.dart';
import 'package:firebase_remainder_app/pages/anime/video_player_page.dart';
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
    final TextEditingController _dayTimeController = TextEditingController();


    DateTime _getNextOccurrenceOfDay(String dayName, String timeString) {
      DateTime now = DateTime.now();

      TimeOfDay time = TimeOfDay.fromDateTime(DateFormat('h:mm a').parse(timeString));

      DateTime scheduledDateTime = DateTime(
          now.year,
          now.month,
          now.day,
          time.hour,
          time.minute
      );

      String currentDayName = DateFormat('EEEE').format(now);

      if (dayName == currentDayName) {
        if (scheduledDateTime.isAfter(now)) {
          return scheduledDateTime;
        }
        return scheduledDateTime.add(const Duration(days: 7));
      }

      final days = {
        'Monday': DateTime.monday,
        'Tuesday': DateTime.tuesday,
        'Wednesday': DateTime.wednesday,
        'Thursday': DateTime.thursday,
        'Friday': DateTime.friday,
        'Saturday': DateTime.saturday,
        'Sunday': DateTime.sunday,
      };

      int targetWeekday = days[dayName]!;
      int daysUntilNextDay = targetWeekday - now.weekday;
      if (daysUntilNextDay <= 0) {
        daysUntilNextDay += 7;
      }

      DateTime nextOccurrence = now.add(Duration(days: daysUntilNextDay));

      return DateTime(
          nextOccurrence.year,
          nextOccurrence.month,
          nextOccurrence.day,
          time.hour,
          time.minute
      );
    }

    void _showAddReminderDialog(String animeId, String animeImage) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          _animeIdController.text = animeId;
          _animeImageController.text = animeImage;

          // Initialize with current time
          _dayTimeController.text = '';

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
                    readOnly: true,
                  ),

                  const SizedBox(height: 16),
                  TextField(
                    controller: _dayTimeController,
                    decoration: const InputDecoration(
                      labelText: 'Reminder Day and Time',
                      hintText: 'Select Day and Time',
                    ),
                    onTap: () async {
                      // Get current day name
                      final currentDayName = DateFormat('EEEE').format(DateTime.now());

                      // Show day picker
                      final List<String> days = [
                        currentDayName,
                        'Monday', 'Tuesday', 'Wednesday',
                        'Thursday', 'Friday', 'Saturday', 'Sunday'
                      ];

                      // Show day selection
                      String? selectedDay = await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: const Text('Select Day'),
                            children: days.map((day) {
                              return SimpleDialogOption(
                                onPressed: () {
                                  Navigator.pop(context, day);
                                },
                                child: Text(day),
                              );
                            }).toList(),
                          );
                        },
                      );

                      if (selectedDay != null) {
                        // Show time picker
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        if (pickedTime != null) {
                          // Combine day and time
                          _dayTimeController.text = '$selectedDay ${pickedTime.format(context)}';
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
                  if (_dayTimeController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select a day and time')),
                    );
                    return;
                  }

                  // Parse the day and time
                  List<String> dayTimeParts = _dayTimeController.text.split(' ');
                  if (dayTimeParts.length < 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid day and time format')),
                    );
                    return;
                  }

                  // Get the day and time
                  String selectedDay = dayTimeParts[0];
                  String timeString = dayTimeParts.sublist(1).join(' ');

                  // Calculate the scheduled time
                  DateTime scheduledTime = _getNextOccurrenceOfDay(selectedDay, timeString);

                  // Schedule the notification
                  LocalNotifications.setScheduleNotification(
                    title: "Reminder",
                    body: "Watch ${_animeIdController.text} now!",
                    scheduledTime: scheduledTime,
                    day: selectedDay,
                    imageUrl: _animeImageController.text,
                    animeId: _animeIdController.text,
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
        if (_animeController.animeEpisodeModel.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final anime = _animeController.animeEpisodeModel.first;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  episodeTitle: 'Episode ${episode.id}',
                  onPlay: () {
                    print(episode);
                    _animeController.getEpisodeStreamingLink(episode.id, context);
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