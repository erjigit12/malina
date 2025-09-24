import 'package:flutter/material.dart';
import 'package:malina/src/core/core.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final ValueChanged<String> onChanged;
  final VoidCallback onToggleVisibility;
  final bool obscureText;

  const PasswordField({
    super.key,
    required this.controller,
    required this.errorText,
    required this.onChanged,
    required this.onToggleVisibility,
    required this.obscureText,
  });

  OutlineInputBorder _outline(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: TextInputAction.done,
      cursorColor: AppColors.primary,
      style: AppTextStyles.f16w400,
      decoration: InputDecoration(
        hintText: 'Пароль',
        hintStyle: AppTextStyles.f16w400.copyWith(color: AppColors.grey),
        errorText: errorText,
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        enabledBorder: _outline(AppColors.lightGrey),
        focusedBorder: _outline(AppColors.primary),
        errorBorder: _outline(AppColors.primary),
        focusedErrorBorder: _outline(AppColors.primary),
        suffixIcon: IconButton(
          onPressed: onToggleVisibility,
          splashRadius: 20,
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            size: 22,
            color: AppColors.lightBlack,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
