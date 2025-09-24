import 'package:flutter/material.dart';
import 'package:malina/src/core/core.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          minimumSize: const Size.fromHeight(56),
          shape: const StadiumBorder(),
          textStyle: AppTextStyles.f16w500.copyWith(color: AppColors.white),
        ),
        onPressed: onPressed,
        child: const Text('Войти'),
      ),
    );
  }
}
