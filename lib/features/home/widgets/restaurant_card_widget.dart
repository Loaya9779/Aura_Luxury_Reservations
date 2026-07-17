import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/features/details_resturant/screen/booking_details_screen.dart';
import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.resturant,
    this.isTrending = false,
  });

  final double width;
  final double height;
  final ResturantModel resturant;
  final bool isTrending;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BookingDetailsScreen(restaurant: resturant),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: 300.w,
            height: 300.h,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              child: Image.network(resturant.image, fit: BoxFit.cover),
            ),
          ),
          if (isTrending)
            Positioned(
              top: 15.h,
              right: -15.w,
              child: Container(
                width: 120.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary),
                ),
                child: Icon(
                  Icons.workspace_premium_outlined,
                  color: AppColors.primary,
                  size: 18.w,
                ),
              ),
            ),
          Positioned(
            bottom: 25.h,
            left: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      resturant.rating.toString(),
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.star_outlined,
                      color: AppColors.primary,
                      size: 15.w,
                    ),
                  ],
                ),
                SizedBox(width: width * 0.01),
                Text(
                  resturant.name,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      resturant.category,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(width: width * 0.01),
                    Text(
                      "•",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(width: width * 0.01),
                    Text(
                      resturant.location.toString(),
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
