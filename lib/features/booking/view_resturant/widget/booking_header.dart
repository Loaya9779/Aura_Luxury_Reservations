import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class BookingHeader extends StatelessWidget {
  const BookingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text: 'Booking\n',
          style: AppStyle.headlineLarge,
          children: [
            TextSpan(
              text: 'Manage your exclusive culinary experiences.\n',
              style: AppStyle.bodyMedium.copyWith(color: AppColors.textSecondary),
            ),
            WidgetSpan(
              child: Center(
                child: Text(
                  'UPCOMING RESERVATIONS',
                  style: AppStyle.bodyLarge.copyWith(color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
