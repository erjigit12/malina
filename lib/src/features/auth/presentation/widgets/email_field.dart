import 'package:flutter/material.dart';
import 'package:malina/src/core/core.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;

  const EmailField({
    super.key,
    required this.controller,
    required this.errorText,
    required this.onChanged,
    this.onClear,
  });

  OutlineInputBorder _outline(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasValue = controller.text.isNotEmpty;

    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      cursorColor: AppColors.primary,
      style: AppTextStyles.f16w400,
      decoration: InputDecoration(
        hintText: 'Почта',
        hintStyle: AppTextStyles.f16w400.copyWith(color: AppColors.grey),
        errorText: errorText,
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        enabledBorder: _outline(AppColors.lightGrey),
        focusedBorder: _outline(AppColors.primary),
        errorBorder: _outline(AppColors.primary),
        focusedErrorBorder: _outline(AppColors.primary),
        suffixIcon: hasValue && onClear != null
            ? IconButton(
                onPressed: onClear,
                splashRadius: 20,
                icon: const Icon(Icons.close, size: 20, color: AppColors.lightBlack),
              )
            : null,
      ),
      onChanged: onChanged,
    );
  }
}
