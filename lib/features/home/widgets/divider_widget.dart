import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height * 0.03),
        Divider(color: AppColors.primary),
        SizedBox(height: height * 0.02),
      ],
    );
  }
}
