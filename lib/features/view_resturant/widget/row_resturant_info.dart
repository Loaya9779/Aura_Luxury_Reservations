import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class RowResturantInfo extends StatelessWidget {
  final String name;
  final String rating;
  final String location;

  const RowResturantInfo({
    super.key,
    required this.name,
    required this.rating,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: AppStyle.labelLarge),
            Spacer(),
            Icon(
              Icons.star,
              color: AppColors.gold,
            ),
            Text(rating, style: AppStyle.labelMedium),
          ],
        ),
        Text(location, style: AppStyle.bodySmall),
      ],
    );
  }
}