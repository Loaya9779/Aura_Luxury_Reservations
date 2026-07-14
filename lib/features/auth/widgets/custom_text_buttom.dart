import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextButtom extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;
  const CustomTextButtom({
    super.key,
    required this.title,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Text(
        title,
        style: AppStyle.labelMedium.copyWith(color: AppColors.secondary),
      ),
    );
  }
}
