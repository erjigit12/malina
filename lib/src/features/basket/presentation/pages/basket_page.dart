import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/features.dart';

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
              CategorySelector(
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
                      return BasketGroupCard(
                        subcategory: entry.key,
                        items: entry.value,
                        category: activeCategory,
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemCount: groupedItems.length,
                  ),
                ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 10,
            onPressed: () {
              context.push(AppRoutes.addBasket);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
