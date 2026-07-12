import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
              child: Image.asset(
                "assets/images/splash.png",
                fit: BoxFit.cover,
              ),
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
                      "4.5",
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
                  "L'Oiseau Bleu",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Modern French",
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
                      "Paris",
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
