import 'package:aura_luxury_reservations/features/details_resturant/screen/booking_details_screen.dart';
import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/booknow_button_widget.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/restaurant_locname_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowRestaurantInfoWidget extends StatelessWidget {
  const RowRestaurantInfoWidget({
    super.key,
    required this.restaurant,
  });

  final ResturantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RestaurantLocNameWidget(restaurant: restaurant),
    
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookingDetailsScreen(
                    restaurant: restaurant,
                  ),
                ),
              );
            },
            child: BookNowButtonWidget(),
          ),
        ],
      ),
    );
  }
}

