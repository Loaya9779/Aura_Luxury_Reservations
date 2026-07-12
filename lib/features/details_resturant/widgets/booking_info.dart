import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

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
          style: AppStyle.headlineLarge.copyWith(color: AppColors.primary),
        ),
        const SizedBox(height: 10),
        Text(description, style: AppStyle.bodyMedium),
      ],
    );
  }
}
