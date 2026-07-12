import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/features/details_resturant/screen/booking_details_screen.dart';
import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';
import 'package:flutter/material.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.resturant,
  });

  final double width;
  final double height;
  final ResturantModel resturant;

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
            width: width * 0.8,
            height: height * 0.35,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(resturant.image, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: height * 0.03,
            left: width * 0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      resturant.rating.toString(),
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: width * 0.04,
                      ),
                    ),
                    SizedBox(width: width * 0.01),
                    Icon(
                      Icons.star_outlined,
                      color: AppColors.primary,
                      size: width * 0.04,
                    ),
                  ],
                ),
                SizedBox(width: width * 0.01),
                Text(
                  resturant.name,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      resturant.name,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: width * 0.04,
                      ),
                    ),
                    SizedBox(width: width * 0.01),
                    Text(
                      "•",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: width * 0.04,
                      ),
                    ),
                    SizedBox(width: width * 0.01),
                    Text(
                      resturant.location.toString(),
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: width * 0.04,
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
