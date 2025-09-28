// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/basket/domain/entities/basket_item_entity.dart';
import 'package:malina/src/features/features.dart';

class BasketGroupCard extends StatelessWidget {
  const BasketGroupCard({super.key, required this.subcategory, required this.items});

  final String subcategory;
  final List<BasketItemEntity> items;

  @override
  Widget build(BuildContext context) {
    final total = items.fold<double>(0, (sum, item) => sum + item.totalPrice);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(subcategory, style: AppTextStyles.f16w500)],
          ),
          const Divider(height: 24, thickness: 0.5, color: AppColors.lightGrey),
          ...items.map((item) => BasketItemTile(item: item)),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Всего',
                  style: AppTextStyles.f16w500.copyWith(color: Colors.white),
                ),
                Text(
                  '${_formatCurrency(total)} C',
                  style: AppTextStyles.f16w500.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _formatCurrency(double value) {
  return value % 1 == 0 ? value.toStringAsFixed(0) : value.toStringAsFixed(2);
}
