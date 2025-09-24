import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:malina/src/core/core.dart';

class QrCard extends StatelessWidget {
  const QrCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/qrhome.svg',
            width: 50,
            height: 58,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'Сканируй QR-код и\nзаказывай прямо\nв заведении',
              style: AppTextStyles.f16w500.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
