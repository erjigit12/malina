import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/basket/domain/entities/basket_item_entity.dart';
import 'package:malina/src/features/basket/presentation/bloc/basket_bloc.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key, required this.initialTab});

  final int initialTab;

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  bool _initialCategoryApplied = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        final categories = state.categories;
        final activeCategory =
            categories.contains(state.activeCategory)
                ? state.activeCategory
                : BasketState.defaultActiveCategory;
        final groupedItems = state.groupedBySubcategory(activeCategory);

        if (!_initialCategoryApplied && categories.isNotEmpty) {
          final targetIndex = widget.initialTab.clamp(0, categories.length - 1);
          final targetCategory = categories[targetIndex];
          if (targetCategory != state.activeCategory) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<BasketBloc>().add(BasketCategorySelected(targetCategory));
            });
          }
          _initialCategoryApplied = true;
        }

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
              onPressed: () => context.pop(),
            ),
            title: Text('Корзина', style: AppTextStyles.f20w700),
            centerTitle: false,
            actions: [
              TextButton(
                onPressed:
                    state.items.isEmpty
                        ? null
                        : () =>
                            context.read<BasketBloc>().add(const BasketCleared()),
                child: Text(
                  'Очистить',
                  style: AppTextStyles.f14w400.copyWith(
                    color: state.items.isEmpty ? AppColors.grey : AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              _CategorySelector(
                categories: categories,
                activeCategory: activeCategory,
              ),
              if (state.isLoading)
                const Expanded(child: Center(child: CircularProgressIndicator()))
              else if (groupedItems.isEmpty)
                Expanded(
                  child: Center(
                    child: Text(
                      'Корзина пуста',
                      style: AppTextStyles.f16w400.copyWith(color: AppColors.grey),
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      final entry = groupedItems.entries.elementAt(index);
                      return _BasketGroupCard(
                        subcategory: entry.key,
                        items: entry.value,
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemCount: groupedItems.length,
                  ),
                ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primary,
            onPressed: () {
              context.push(AppRoutes.addBasket);
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
        );
      },
    );
  }
}

class _CategorySelector extends StatelessWidget {
  const _CategorySelector({required this.categories, required this.activeCategory});

  final List<String> categories;
  final String activeCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isActive = category == activeCategory;
          return ChoiceChip(
            label: Text(category),
            labelStyle: AppTextStyles.f16w400.copyWith(
              color: isActive ? Colors.white : AppColors.black,
            ),
            backgroundColor: AppColors.lightGrey,
            selectedColor: AppColors.primary,
            selected: isActive,
            onSelected: (_) {
              context.read<BasketBloc>().add(BasketCategorySelected(category));
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        },
      ),
    );
  }
}

class _BasketGroupCard extends StatelessWidget {
  const _BasketGroupCard({required this.subcategory, required this.items});

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
            children: [
              Text(subcategory, style: AppTextStyles.f16w500),
              IconButton(
                icon: const Icon(Icons.delete_outline, color: AppColors.lightBlack),
                onPressed: () {
                  final category = items.first.category;
                  context.read<BasketBloc>().add(
                    BasketSubcategoryCleared(
                      category: category,
                      subcategory: subcategory,
                    ),
                  );
                },
              ),
            ],
          ),
          const Divider(height: 24, thickness: 0.5, color: AppColors.lightGrey),
          ...items.map((item) => _BasketItemTile(item: item)),
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
                const Text(
                  'Всего',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  '${_formatCurrency(total)} C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BasketItemTile extends StatelessWidget {
  const _BasketItemTile({required this.item});

  final BasketItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ItemThumbnail(name: item.name, imagePath: item.imagePath),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: AppTextStyles.f16w500),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _QuantityControl(item: item),
                    Text(
                      '${_formatCurrency(item.price)} C',
                      style: AppTextStyles.f16w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed:
                () => context.read<BasketBloc>().add(BasketItemRemoved(item.id)),
          ),
        ],
      ),
    );
  }
}

class _QuantityControl extends StatelessWidget {
  const _QuantityControl({required this.item});

  final BasketItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _QuantityButton(
          icon: Icons.remove,
          onPressed: () {
            final newQuantity = item.quantity - 1;
            if (newQuantity >= 0) {
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
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(icon, size: 20, color: AppColors.black),
        onPressed: onPressed,
      ),
    );
  }
}

class _ItemThumbnail extends StatelessWidget {
  const _ItemThumbnail({required this.name, this.imagePath});

  final String name;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    if (imagePath != null && imagePath!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(imagePath!, width: 80, height: 80, fit: BoxFit.cover),
      );
    }

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '?',
        style: AppTextStyles.f20w700,
      ),
    );
  }
}

String _formatCurrency(double value) {
  return value % 1 == 0 ? value.toStringAsFixed(0) : value.toStringAsFixed(2);
}
