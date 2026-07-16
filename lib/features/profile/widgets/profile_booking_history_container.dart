import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/features/details_resturant/model/booking_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ProfileBookingHistoryContainer extends StatelessWidget {
  final BookingModel myBooking;

  const ProfileBookingHistoryContainer({super.key, required this.myBooking});

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
              myBooking.restaurant.image,
              height: 60,
              width: 60,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                myBooking.restaurant.name,
                style: AppStyle.headlineExtraSmall,
              ),
              Text(myBooking.restaurant.location, style: AppStyle.bodySmall),
              Text(
                DateFormat("MMM d, yyyy").format(myBooking.date),
                style: AppStyle.bodySmall,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Status", style: AppStyle.bodySmall),
              Text(myBooking.status, style: AppStyle.labelMedium),
            ],
          ),
        ],
      ),
    );
  }
}
