// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/features.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key, required this.initialTab});

  final int initialTab;

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage>
    with SingleTickerProviderStateMixin {
  int foodCount = 1;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTab,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            child: Text('Очистить', style: AppTextStyles.f14w400),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              indicatorColor: Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              dividerColor: Colors.transparent,
              labelPadding: EdgeInsets.zero,
              tabs: [
                TabButton(text: 'Еда', index: 0, controller: _tabController),
                TabButton(text: 'Бьюти', index: 1, controller: _tabController),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Еда
                FoodBasket(
                  count: foodCount,
                  onAdd: () => setState(() => foodCount++),
                  onRemove:
                      () => setState(() {
                        if (foodCount > 1) foodCount--;
                      }),
                ),
                // Бьюти
                const Center(child: Text('Бьюти пока пусто')),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
