import 'package:aura_luxury_reservations/features/confirmation/widget/tiecket_info_widget.dart';
import 'package:flutter/material.dart';

class TicketDataWidget extends StatelessWidget {
  const TicketDataWidget({
    super.key,
    required this.date,
    required this.time,
    required this.guestsCount,
  });

  final String date;
  final String time;
  final int guestsCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TicketInfoWidget(title: "Date", info: date),
            ),
            Expanded(
              child: TicketInfoWidget(title: "Time", info: time),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TicketInfoWidget(title: "Table", info: "Window 12"),
            ),
            Expanded(
              child: TicketInfoWidget(
                title: "Guests",
                info: guestsCount < 10
                    ? "0$guestsCount Persons"
                    : "$guestsCount Persons",
              ),
            ),
          ],
        ),
      ],
    );
  }
}