import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedDotContainer extends StatelessWidget {
  final bool isSelected;
  const AnimatedDotContainer({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 10.w,
      height: 10.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isSelected ? AppColors.primary : AppColors.surfaceHighest,
      ),
    );
  }
}
