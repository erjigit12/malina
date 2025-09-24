// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:malina/src/core/constants/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Искать в Malina',
            hintStyle: AppTextStyles.f14w400.copyWith(color: Colors.grey),
            border: InputBorder.none,
            icon: Icon(Icons.search, color: AppColors.grey),
          ),
        ),
      ),
    );
  }
}
