import 'package:flutter/material.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/features.dart';

class QrProductPreview extends StatelessWidget {
  const QrProductPreview({super.key, required this.product, required this.onAdd});

  final QrProduct product;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductThumbnail(product: product),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, style: AppTextStyles.f16w500),
                    const SizedBox(height: 4),
                    if ((product.description ?? '').isNotEmpty)
                      Text(
                        product.description!,
                        style: AppTextStyles.f12w400.copyWith(
                          color: AppColors.lightBlack,
                        ),
                      ),
                    const SizedBox(height: 8),
                    Text(
                      '${product.price.toStringAsFixed(0)} C',
                      style: AppTextStyles.f16w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ConfirmButton(title: 'Добавить', onPressed: onAdd),
          ),
        ],
      ),
    );
  }
}

class _ProductThumbnail extends StatelessWidget {
  const _ProductThumbnail({required this.product});

  final QrProduct product;

  @override
  Widget build(BuildContext context) {
    if (product.image != null && product.image!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(product.image!, width: 72, height: 72, fit: BoxFit.cover),
      );
    }

    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        product.name.isNotEmpty ? product.name[0].toUpperCase() : '?',
        style: AppTextStyles.f16w500,
      ),
    );
  }
}
