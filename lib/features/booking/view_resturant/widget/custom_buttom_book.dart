import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtomBook extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const CustomButtomBook({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
        foregroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(title),
    );
  }
}