import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/features/confirmation/widget/confirmation_body_widget.dart';
import 'package:aura_luxury_reservations/core/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final String restaurantName;
  final String date;
  final String time;
  final int guestsCount;

  const ConfirmationScreen({
    super.key,
    required this.restaurantName,
    required this.date,
    required this.time,
    required this.guestsCount,
  });

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    final ticketWidth = (screenWidth * 0.88).clamp(280.0, 450.0);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBarWidget(isHome: false),
      ),
      body: SafeArea(
        child: ConfirmationBodyWidget(
          restaurantName: restaurantName,
          ticketWidth: ticketWidth,
          date: date,
          time: time,
          guestsCount: guestsCount,
        ),
      ),
    );
  }
}
