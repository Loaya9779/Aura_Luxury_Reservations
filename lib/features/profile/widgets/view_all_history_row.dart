import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class ViewAllHistoryRow extends StatelessWidget {
  const ViewAllHistoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Reservation History", style: AppStyle.headlineMedium),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/my-bookings");
          },
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text("VIEW ALL", style: AppStyle.labelSmall),
        ),
      ],
    );
  }
}
