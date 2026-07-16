import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class TicketInfoWidget extends StatelessWidget {
  final String title;
  final String info;

  const TicketInfoWidget({super.key, required this.title, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: AppStyle.bodySmall),

        const SizedBox(height: 6),

        Text(
          info,
          style: AppStyle.headlineMedium.copyWith(color: AppColors.primary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
