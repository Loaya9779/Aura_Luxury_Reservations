import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
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
          minimumSize: Size(double.infinity, 70.h),
        ),
        child: Text(title , style: AppStyle.labelMedium,),
      ),
    );
  }
}