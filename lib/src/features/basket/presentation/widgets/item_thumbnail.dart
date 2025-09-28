import 'package:flutter/material.dart';
import 'package:malina/src/core/core.dart';

class ItemThumbnail extends StatelessWidget {
  const ItemThumbnail({super.key, required this.name, this.imagePath});

  final String name;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    if (imagePath != null && imagePath!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(imagePath!, width: 80, height: 80, fit: BoxFit.cover),
      );
    }

    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '?',
        style: AppTextStyles.f20w700,
      ),
    );
  }
}
