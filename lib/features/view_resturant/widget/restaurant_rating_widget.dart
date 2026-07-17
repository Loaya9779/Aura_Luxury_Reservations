import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantRating extends StatelessWidget {
  const RestaurantRating({super.key, required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: .35),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: Color(0xffE5C75D), size: 15),
          SizedBox(width: 6.w),
          Text(
            rating.toString(),
            style: TextStyle(
              color: const Color(0xffE5C75D),
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
