import 'package:flutter/material.dart';

class AnimeEpisodeCard extends StatelessWidget {
  final String episodeNumber;
  final String episodeTitle;
  final VoidCallback onPlay;
  final String thumbnailUrl;

  const AnimeEpisodeCard({
    super.key,
    required this.episodeNumber,
    required this.episodeTitle,
    required this.onPlay,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 54, 52, 52),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Thumbnail section
          Container(
            width: 128,
            decoration: BoxDecoration(
              image: thumbnailUrl != null
                  ? DecorationImage(
                      image: NetworkImage(thumbnailUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: Colors.grey[800],
            ),
          ),

          // Episode info section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Episode $episodeNumber',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '"${episodeTitle}"',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),

          // Play button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPlay,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              child: Container(
                width: 48,
                height: double.infinity,
                alignment: Alignment.center,
                child: Icon(
                  Icons.play_circle_outline_outlined,
                  color: Colors.grey[400],
                  size: 34,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
