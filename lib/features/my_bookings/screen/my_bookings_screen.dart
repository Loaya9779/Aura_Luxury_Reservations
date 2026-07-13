import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_app_bar.dart';
import 'package:aura_luxury_reservations/features/my_bookings/widgets/book_history_row.dart';
import 'package:aura_luxury_reservations/features/my_bookings/widgets/my_booking_header.dart';
import 'package:flutter/material.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(isCenter: true),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 25, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [MyBookingHeader(), BookHistoryRow()],
        ),
      ),
    );
  }
}
