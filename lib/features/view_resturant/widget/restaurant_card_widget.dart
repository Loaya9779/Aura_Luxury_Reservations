import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/restaurant_image_widget.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/row_restaurant_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  final ResturantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff171717),
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(
          color: Colors.white.withOpacity(.08),
        ),
      ),
      child: Column(
        children: [
          RestaurantImage(
            restaurant: restaurant,
          ),

          RowRestaurantInfoWidget(
            restaurant: restaurant,
          ),
        ],
      ),
    );
  }
}