import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_app_bar.dart';
import 'package:aura_luxury_reservations/features/my_bookings/cubit/my_bookings_cubit.dart';
import 'package:aura_luxury_reservations/features/my_bookings/cubit/states.dart';
import 'package:aura_luxury_reservations/features/my_bookings/widgets/book_history_row.dart';
import 'package:aura_luxury_reservations/features/my_bookings/widgets/booking_history_container.dart';
import 'package:aura_luxury_reservations/features/my_bookings/widgets/my_booking_header.dart';
import 'package:aura_luxury_reservations/features/my_bookings/widgets/my_bookings_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          children: [
            MyBookingHeader(),
            BookHistoryRow(),
            BlocBuilder<MyBookingsCubit, MyBookingsState>(
              builder: (context, state) {
                if (state is MybookingsLoadingState) {
                  return MyBookingsShimmer();
                } else if (state is MybookingsSuccessState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.mybookings.length,
                      itemBuilder: (context, index) {
                        return BookingHistoryContainer(
                          myBooking: state.mybookings[index],
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text("Network Error", style: AppStyle.bodyLarge),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
