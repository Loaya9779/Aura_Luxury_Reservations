import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/features/confirmation/widget/qr_ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticketcher/ticketcher.dart';

Section secondSectionWidget() {
  return Section(
    padding: EdgeInsets.zero,
    color: Colors.black,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const QrTicketWidget(reservationId: "LUX-483291"),
          const SizedBox(height: 16),
          Text(
            "LUX-483291",
            style: AppStyle.headlineSmall.copyWith(
              color: AppColors.white,
              letterSpacing: 3,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Scan upon arrival",
            style: AppStyle.bodySmall.copyWith(color: Colors.white70),
          ),
        ],
      ),
    ),
  );
}
