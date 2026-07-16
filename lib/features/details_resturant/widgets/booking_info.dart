import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingInfo extends StatelessWidget {
  final String name;
  final String description;

  const BookingInfo({super.key, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppStyle.headlineMedium.copyWith(color: AppColors.primary),
        ),
        SizedBox(height: 10.h),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            description,
            style: AppStyle.bodyMedium,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
