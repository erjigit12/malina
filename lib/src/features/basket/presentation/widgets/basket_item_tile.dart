import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/basket/domain/entities/basket_item_entity.dart';
import 'package:malina/src/features/features.dart';

class BasketItemTile extends StatelessWidget {
  const BasketItemTile({super.key, required this.item});

  final BasketItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemThumbnail(name: item.name, imagePath: item.imagePath),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: AppTextStyles.f16w500,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (item.description != null && item.description!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    item.description!,
                    style: AppTextStyles.f12w400.copyWith(
                      color: const Color(0xFF777777),
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                QuantityControl(item: item),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${_formatCurrency(item.price)} C', style: AppTextStyles.f16w500),
              const SizedBox(height: 24),
              IconButton(
                icon: SvgPicture.asset('assets/icons/delete.svg'),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed:
                    () => context.read<BasketBloc>().add(BasketItemRemoved(item.id)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String _formatCurrency(double value) {
  return value % 1 == 0 ? value.toStringAsFixed(0) : value.toStringAsFixed(2);
}
