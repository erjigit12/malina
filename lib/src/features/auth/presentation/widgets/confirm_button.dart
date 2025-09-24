import 'package:flutter/material.dart';
import 'package:malina/src/core/core.dart';

class ConfirmButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final String title;

  const ConfirmButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.title = 'Войти',
  });

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
        onPressed: isLoading ? null : onPressed,
        child:
            isLoading
                ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                  ),
                )
                : Text(title),
      ),
    );
  }
}
