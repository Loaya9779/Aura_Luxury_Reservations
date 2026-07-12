import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/features/home/widgets/app_bar_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/home_title_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/restaurant_card_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/search_textfield_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBarWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextField(),

                SizedBox(height: height * 0.03),
                HomeTitleWidget(width: width, height: height),
                SizedBox(height: height * 0.03),
                SizedBox(
                  height: height * 0.35,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return RestaurantCardWidget(width: width, height: height);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: width * 0.03);
                    },
                    itemCount: 4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
