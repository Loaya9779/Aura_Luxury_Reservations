import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/features/details_resturant/model/booking_model.dart';
import 'package:flutter/material.dart';

class BookingHistoryContainer extends StatelessWidget {
  final BookingModel myBooking;
  const BookingHistoryContainer({super.key, required this.myBooking});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 10),
      height: height * .25,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.surfaceHighest),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.network(
              myBooking.restaurant.image,
              height: height * 0.12,
              width: width * 0.25,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: width * 0.3),
              child: Column(
                children: [
                  Text(
                    myBooking.restaurant.name,
                    style: AppStyle.headlineExtraSmall,
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Date: ${myBooking.date.day}/${myBooking.date.month}/${myBooking.date.year}",
                    style: AppStyle.bodySmall.copyWith(
                      color: AppColors.textSecondary.withValues(alpha: 0.5),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Time: ${myBooking.time.hour}:${myBooking.time.minute}",
                    style: AppStyle.bodySmall.copyWith(
                      color: AppColors.textSecondary.withValues(alpha: 0.5),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "${myBooking.guestCount} Guests",
                    style: AppStyle.bodySmall.copyWith(
                      color: AppColors.textSecondary.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
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
