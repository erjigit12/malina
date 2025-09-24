import 'package:flutter/material.dart';
import 'package:malina/src/core/core.dart';

class CategoryCard extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String image;

  const CategoryCard({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.f22w600),
                  const SizedBox(height: 8),
                  Text(subtitle, style: AppTextStyles.f16w300),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
