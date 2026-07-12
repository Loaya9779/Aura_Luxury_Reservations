import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Featured For You",
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
              "Selected for your exquisite taste",
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: width * 0.04,
                // fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/resturants");
              },
              child: Text(
                "View All",
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
