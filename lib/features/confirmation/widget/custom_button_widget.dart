import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtomWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const CustomButtomWidget({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.black,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
