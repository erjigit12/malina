import 'package:flutter/material.dart';
import 'package:malina/src/core/core.dart';
import 'package:malina/src/features/features.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(),
              const SizedBox(height: 16),
              QrCard(),
              const SizedBox(height: 16),
              CategoryCard(
                color: AppColors.foodColor,
                title: 'Еда',
                subtitle: 'Из кафе и ресторанов',
                image: 'assets/images/food.png',
              ),
              const SizedBox(height: 16),
              CategoryCard(
                color: AppColors.beautyColor,
                title: 'Бьюти',
                subtitle: 'Салоны красоты и товары',
                image: 'assets/images/beauty.png',
              ),
              const SizedBox(height: 32),
              _SoonSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SoonSection extends StatelessWidget {
  const _SoonSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Скоро в Malina', style: AppTextStyles.f17w500),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              _SoonCard(color: Color(0xFFE6EEFF), title: 'Вакансии'),
              SizedBox(width: 12),
              _SoonCard(color: Color(0xFFFFE6CC), title: 'Маркет'),
              SizedBox(width: 12),
              _SoonCard(color: Color(0xFFFFE6EC), title: 'Цветы'),
              SizedBox(width: 12),
              _SoonCard(color: Color(0xFFE6E6FF), title: 'Доставка'),
              SizedBox(width: 12),
              _SoonCard(color: Color(0xFFE6FFF2), title: 'Аптеки'),
              SizedBox(width: 12),
              _SoonCard(color: Color(0xFFFFF3E6), title: 'Такси'),
            ],
          ),
        ),
      ],
    );
  }
}

class _SoonCard extends StatelessWidget {
  final Color color;
  final String title;

  const _SoonCard({required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: 86,
      height: 86,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(title, style: AppTextStyles.f12w400),
      ),
    );
  }
}
