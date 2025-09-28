// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:malina/src/core/core.dart';

class BasketMenuPopup extends StatelessWidget {
  const BasketMenuPopup({super.key, required this.parentContext});
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 69),
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 65,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 12,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _MenuCircleItem(
                  onTap: () {
                    Navigator.of(context).pop();
                    parentContext.push(AppRoutes.basket, extra: 0);
                  },
                  icon: Icons.restaurant_menu,
                  label: 'Еда',
                  notification: false,
                ),
                const SizedBox(height: 12),
                _MenuCircleItem(
                  onTap: () {
                    Navigator.of(context).pop();
                    parentContext.push(AppRoutes.basket, extra: 1);
                  },
                  icon: Icons.spa,
                  label: 'Бьюти',
                  notification: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuCircleItem extends StatelessWidget {
  const _MenuCircleItem({
    required this.icon,
    required this.label,
    this.notification = false,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool notification;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 25, color: Colors.black87),
                const SizedBox(height: 6),
                Text(label, style: AppTextStyles.f10w400),
              ],
            ),
          ),
          if (notification)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
