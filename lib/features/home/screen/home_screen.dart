import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/features/home/widgets/app_bar_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/home_title_widget.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(),

            SizedBox(height: height * 0.04),
            HomeTitleWidget(width: width, height: height),
            
          ],
        ),
      ),
    );
  }
}
