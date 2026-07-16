import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class ProfileBookingHistoryContainer extends StatelessWidget {
  const ProfileBookingHistoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: 16),
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.surfaceHighest),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Image.network(
              "https://cdn.corenexis.com/f/l1lD1ip39ER.png",
              height: 60,
              width: 60,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("L'Ambroisie", style: AppStyle.headlineExtraSmall),
              Text("Paris, France", style: AppStyle.bodySmall),
              Text("Oct 14, 2023", style: AppStyle.bodySmall),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Status", style: AppStyle.bodySmall),
              Text("COMPLETED", style: AppStyle.labelMedium),
            ],
          ),
        ],
      ),
    );
  }
}
