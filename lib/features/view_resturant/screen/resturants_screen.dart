import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_app_bar.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/resturants_header.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/resturant_list.dart';
import 'package:flutter/material.dart';

class ResturantsScreen extends StatelessWidget {
  const ResturantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(isCenter: true, icon: Icon(Icons.menu)),
      body: Column(
        children: [
          BookingHeader(),
          Expanded(child: ResturantList()),
        ],
      ),
    );
  }
}
