import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class ConfirmationTextWidget extends StatelessWidget {
  const ConfirmationTextWidget({super.key, required this.restaurantName});

  final String restaurantName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Reservation Confirmed",
          style: AppStyle.headlineLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "Your evening at $restaurantName is secured. We look forward to providing you with an unforgettable culinary journey.",
            style: AppStyle.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
