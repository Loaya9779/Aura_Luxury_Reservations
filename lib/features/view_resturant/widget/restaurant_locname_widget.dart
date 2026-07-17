import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantLocNameWidget extends StatelessWidget {
  const RestaurantLocNameWidget({
    super.key,
    required this.restaurant,
  });

  final ResturantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.location.toUpperCase(),
              style: AppStyle.labelSmall,
            ),
            SizedBox(height: 10.h),
            Text(
              restaurant.name,
              style: AppStyle.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
