import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String genre;
  final String rating;
  final String description;
  final VoidCallback onTap;

  const AnimeCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.rating,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 8, vertical: 3), // Adds separation between cards
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Image Section
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(12), // Fully rounded corners
                child: Image.network(
                  imageUrl,
                  width: 125,
                  height: 175,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 100,
                    height: 140,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.broken_image,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12), // Space between image and text
              // Content Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize:
                      MainAxisSize.min, // Avoid expanding unnecessarily
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // const SizedBox(height: 2),
                    Text(
                      genre,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          rating,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                      ],
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 13),
                    ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                      ),
                      child: const Text(
                        'Watch Now',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
