import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class MyBookingHeader extends StatelessWidget {
  const MyBookingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      strutStyle: StrutStyle(height: 3),
      text: TextSpan(
        children: [
          TextSpan(text: "My Bookings\n", style: AppStyle.headlineExtraLarge),
          TextSpan(
            text: "Manage your exclusive culinary experiences.\n",
            style: AppStyle.bodyMedium,
          ),
        ],
      ),
    );
  }
}
