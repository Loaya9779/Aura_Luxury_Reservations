import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class BookingHistoryContainer extends StatelessWidget {
  const BookingHistoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.all(20),
      height: height * .25,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.surfaceHighest),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/splash.png",
            height: height * 0.15,
            width: width * 0.15,
          ),
          Column(
            children: [
              Text("Restaurant Name", style: AppStyle.headlineExtraSmall),
              Text(
                "Date Time and Guests",
                style: AppStyle.bodyExtraSmall.copyWith(
                  color: AppColors.textSecondary.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: AppColors.gold,
            ),
            child: Row(children: [Text("Rebook"), Icon(Icons.arrow_right_alt)]),
          ),
        ],
      ),
    );
  }
}
