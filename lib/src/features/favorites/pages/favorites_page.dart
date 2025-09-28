import 'package:flutter/material.dart';
import 'package:malina/src/core/core.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Избранное', style: AppTextStyles.f20w700),
      ),
      body: Center(child: Text('Избранное пустое', style: AppTextStyles.f16w400)),
    );
  }
}
