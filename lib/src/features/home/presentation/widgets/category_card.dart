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
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                image,
                height: double.infinity,
                alignment: Alignment.centerRight,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.f22w600),
                const SizedBox(height: 8),
                Expanded(child: Text(subtitle, style: AppTextStyles.f16w300)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
