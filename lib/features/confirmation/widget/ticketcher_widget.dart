import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/features/confirmation/widget/first_section_widget.dart';
import 'package:aura_luxury_reservations/features/confirmation/widget/second_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticketcher/ticketcher.dart';

class TicketcherWidget extends StatelessWidget {
  const TicketcherWidget({
    super.key,
    required this.ticketWidth,
    required this.restaurantName,
    required this.date,
    required this.time,
    required this.guestsCount,
  });

  final double ticketWidth;
  final String restaurantName;
  final String date;
  final String time;
  final int guestsCount;

  @override
  Widget build(BuildContext context) {
    return Ticketcher(
      width: ticketWidth,
      decoration: TicketcherDecoration(
        backgroundColor: Colors.black,
        notchStyle: const NotchStyle.semicircle(radius: 12),
        borderGradient: LinearGradient(
          colors: [AppColors.primary, AppColors.black],
        ),
        borderWidth: 2,
        divider: TicketDivider.dashed(
          color: AppColors.primary,
          dashWidth: 4,
          dashSpace: 5,
        ),
      ),
      sections: [
        firstSectionWidget(
          restaurantName: restaurantName,
          date: date,
          time: time,
          guestsCount: guestsCount,
        ),
        secondSectionWidget(),
      ],
    );
  }
}
