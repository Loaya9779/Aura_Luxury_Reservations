import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget({super.key, required this.width, required this.height, required this.title, required this.subtitle, this.buttonText, this.onTap});

  final double width;
  final double height;
  final String title;
  final String subtitle;
  final String? buttonText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: width * 0.06,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: height * 0.001),
        Row(
          children: [
            Text(
              subtitle,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: width * 0.04,
                // fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: onTap,
              child: Text(
                buttonText ?? "",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
