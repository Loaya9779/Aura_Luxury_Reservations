import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryRestaurantWidget extends StatelessWidget {
  const CategoryRestaurantWidget({
    super.key,
    required this.restaurant,
  });

  final ResturantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: .35),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Text(
        restaurant.category,
        style: TextStyle(
          color: Color(0xffE5C75D),
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
