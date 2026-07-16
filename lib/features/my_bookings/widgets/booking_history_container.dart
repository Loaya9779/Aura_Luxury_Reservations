import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/features/details_resturant/model/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingHistoryContainer extends StatelessWidget {
  final BookingModel myBooking;
  const BookingHistoryContainer({super.key, required this.myBooking});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      margin: EdgeInsets.only(bottom: 10.w),
      decoration: BoxDecoration(
        border: Border.all(width: 1.w, color: AppColors.surfaceHighest),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10.r),
            child: Image.network(
              myBooking.restaurant.image,
              height: 80.h,
              width: 80.w,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 110.w),
              child: Column(
                children: [
                  Text(
                    myBooking.restaurant.name,
                    style: AppStyle.headlineExtraSmall,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Date: ${myBooking.date.day}/${myBooking.date.month}/${myBooking.date.year}",
                    style: AppStyle.bodySmall.copyWith(
                      color: AppColors.textSecondary.withValues(alpha: 0.5),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Time: ${myBooking.time.hour}:${myBooking.time.minute}",
                    style: AppStyle.bodySmall.copyWith(
                      color: AppColors.textSecondary.withValues(alpha: 0.5),
                    ),
                  ),
                  SizedBox(height: 8.h),
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
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(width: 1.w, color: AppColors.surfaceHighest),
            ),
            child: Text(myBooking.status, style: AppStyle.bodyExtraSmall),
          ),
        ],
      ),
    );
  }
}
