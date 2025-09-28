// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/basket/domain/entities/basket_item_entity.dart';
import 'package:malina/src/features/features.dart';

class BasketGroupCard extends StatelessWidget {
  const BasketGroupCard({
    super.key,
    required this.subcategory,
    required this.items,
    required this.category,
  });

  final String subcategory;
  final List<BasketItemEntity> items;
  final String category;

  @override
  Widget build(BuildContext context) {
    final isFoodCategory = category.toLowerCase() == 'еда';
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(subcategory, style: AppTextStyles.f16w500),

              const Icon(Icons.chevron_right, size: 18, color: AppColors.lightBlack),
            ],
          ),
          const Divider(height: 24, thickness: 1, color: AppColors.lightGrey),
          ...items.map(
            (item) => BasketItemTile(item: item, showPromoBadge: !isFoodCategory),
          ),
          if (isFoodCategory) ...[
            const SizedBox(height: 10),
            const _AddonsButton(),
          ] else
            const SizedBox(height: 10),
          const SizedBox(height: 16),
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

class _AddonsButton extends StatelessWidget {
  const _AddonsButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/icons/plus.svg', color: AppColors.green),
          const SizedBox(width: 8),
          Text('Добавки', style: AppTextStyles.f16w400),
        ],
      ),
    );
  }
}
