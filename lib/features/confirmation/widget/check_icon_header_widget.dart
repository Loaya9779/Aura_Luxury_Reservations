import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';

class CheckIconHeaderWidget extends StatelessWidget {
  const CheckIconHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.outlineVariant,
      ),
      child: Icon(
        Icons.check_circle_outline,
        color: AppColors.primary,
        size: 40,
      ),
    );
  }
}
