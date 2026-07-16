import 'package:aura_luxury_reservations/features/confirmation/widget/check_icon_header_widget.dart';
import 'package:aura_luxury_reservations/features/confirmation/widget/confirmation_text_widget.dart';
import 'package:aura_luxury_reservations/features/confirmation/widget/custom_button_widget.dart';
import 'package:aura_luxury_reservations/features/confirmation/widget/ticketcher_widget.dart';
import 'package:flutter/material.dart';

class ConfirmationBodyWidget extends StatelessWidget {
  const ConfirmationBodyWidget({
    super.key,
    required this.restaurantName,
    required this.ticketWidth,
    required this.date,
    required this.time,
    required this.guestsCount,
  });

  final String restaurantName;
  final double ticketWidth;
  final String date;
  final String time;
  final int guestsCount;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                CheckIconHeaderWidget(),
                const SizedBox(height: 16),
                ConfirmationTextWidget(restaurantName: restaurantName),
                const SizedBox(height: 12),
                const SizedBox(height: 24),
                Center(
                  child: TicketcherWidget(ticketWidth: ticketWidth, restaurantName: restaurantName, date: date, time: time, guestsCount: guestsCount),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: ticketWidth,
                  child: CustomButtomWidget(
                    title: 'Done',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/home");
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}





