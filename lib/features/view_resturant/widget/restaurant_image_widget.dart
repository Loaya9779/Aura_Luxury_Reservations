import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/category_restaurant_widget.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/linear_gradient_widget.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/restaurant_rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantImage extends StatelessWidget {
  const RestaurantImage({super.key, required this.restaurant});

  final ResturantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      child: Stack(
        children: [
          SizedBox(
            height: 260.h,
            width: double.infinity,
            child: Image.network(restaurant.image, fit: BoxFit.cover),
          ),

          const LinearGradientWidget(),

          Padding(
            padding: EdgeInsets.all(18.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryRestaurantWidget(restaurant: restaurant),

                RestaurantRating(rating: restaurant.rating),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
