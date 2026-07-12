import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class GuestCounter extends StatelessWidget {
  final int guests;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const GuestCounter({
    super.key,
    required this.guests,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Text(
          "Guests",
          style: AppStyle.bodyLarge,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.remove_circle, color: AppColors.gold),
            ),
            Text(
              "$guests",
              style: AppStyle.bodyMedium.copyWith(color: AppColors.white),
            ),
            IconButton(
              onPressed: onAdd,
              icon: const Icon(Icons.add_circle, color: AppColors.gold),
            ),
          ],
        ),
      ],
    );
  }
}
