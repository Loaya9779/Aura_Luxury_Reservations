import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MyBookingsShimmer extends StatelessWidget {
  const MyBookingsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Expanded(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(20),
            height: height * .25,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.surfaceHighest),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Shimmer.fromColors(
              baseColor: AppColors.gold,
              highlightColor: Colors.grey.shade100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الصورة
                  Container(
                    height: 200.h,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // اسم المطعم
                  Container(
                    height: 20.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // الزرار
                  Container(
                    height: 48.h,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
