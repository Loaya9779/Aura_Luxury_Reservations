import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrTicketWidget extends StatelessWidget {
  const QrTicketWidget({super.key, required this.reservationId});

  final String reservationId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: SizedBox(
          height: 170,
          width: 170,
          child: QrImageView(
            data: reservationId,
            version: QrVersions.auto,
            size: 170,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
