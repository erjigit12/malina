import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/features.dart';

class QuantityControl extends StatelessWidget {
  const QuantityControl({super.key, required this.item});

  final BasketItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _QuantityButton(
          icon: Icons.remove,
          onPressed: () {
            final newQuantity = item.quantity - 1;
            if (newQuantity >= 1) {
              context.read<BasketBloc>().add(
                BasketItemQuantityChanged(itemId: item.id, quantity: newQuantity),
              );
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('${item.quantity}', style: AppTextStyles.f20w700),
        ),
        _QuantityButton(
          icon: Icons.add,
          onPressed:
              () => context.read<BasketBloc>().add(
                BasketItemQuantityChanged(
                  itemId: item.id,
                  quantity: item.quantity + 1,
                ),
              ),
        ),
      ],
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightGrey),
      ),
      child: IconButton(
        icon: Icon(icon, size: 20, color: AppColors.black),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
