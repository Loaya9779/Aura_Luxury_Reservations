import 'package:aura_luxury_reservations/features/confirmation/widget/ticket_data_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketcher/ticketcher.dart';
import 'package:flutter/material.dart';
import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';

Section firstSectionWidget({
  required String restaurantName,
  required String date,
  required String time,
  required int guestsCount,
}) {
  return Section(
    padding: EdgeInsets.zero,
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
        bottomRight: Radius.circular(30),
        bottomLeft: Radius.circular(35),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Image.asset(
                "assets/images/confirm_card_bg.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(color: Colors.black.withValues(alpha: .75)),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Confirmed Entry",
                          style: AppStyle.headlineSmall.copyWith(
                            color: AppColors.primary,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          restaurantName,
                          style: AppStyle.headlineMedium.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    TicketDataWidget(
                      date: date,
                      time: time,
                      guestsCount: guestsCount,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
