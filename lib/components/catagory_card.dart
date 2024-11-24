import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath; // Updated to handle local image paths
  final String title;
  final String description;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Row(
            children: [
              // Image section
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Text section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
