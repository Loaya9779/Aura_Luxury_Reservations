import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const CustomButtom({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(title, style: TextStyle(color: AppColors.black)),
      ),
    );
  }
}
