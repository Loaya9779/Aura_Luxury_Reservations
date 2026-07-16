import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/core/widgets/app_bar_widget.dart';
import 'package:aura_luxury_reservations/features/my_bookings/cubit/my_bookings_cubit.dart';
import 'package:aura_luxury_reservations/features/my_bookings/cubit/states.dart';
import 'package:aura_luxury_reservations/features/my_bookings/widgets/book_history_row.dart';
import 'package:aura_luxury_reservations/features/my_bookings/widgets/booking_history_container.dart';
import 'package:aura_luxury_reservations/features/my_bookings/widgets/my_booking_header.dart';
import 'package:aura_luxury_reservations/features/my_bookings/widgets/my_bookings_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyBookingsCubit>().getUserBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarWidget(isHome: false),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 25.w, vertical: 50.h),
        child: SingleChildScrollView(
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
                    if (state.mybookings.isEmpty) {
                      return Center(
                        child: Text(
                          "You have no bookings yet.",
                          style: AppStyle.bodyLarge,
                        ),
                      );
                    }
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.mybookings.length,
                      itemBuilder: (context, index) {
                        return BookingHistoryContainer(
                          myBooking: state.mybookings[index],
                        );
                      },
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
      ),
    );
  }
}
