import 'package:aura_luxury_reservations/features/my_bookings/cubit/my_bookings_cubit.dart';
import 'package:aura_luxury_reservations/features/my_bookings/cubit/states.dart';
import 'package:aura_luxury_reservations/features/profile/widgets/profile_booking_history_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBookingHistoryListview extends StatelessWidget {
  const ProfileBookingHistoryListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBookingsCubit, MyBookingsState>(
      builder: (context, state) {
        if (state is MybookingsLoadingState) {
          return CircularProgressIndicator();
        }
        if (state is MybookingsSuccessState) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.mybookings.length,
            itemBuilder: (context, index) {
              return ProfileBookingHistoryContainer(
                myBooking: state.mybookings[index],
              );
            },
          );
        }
        return Center(child: Text("You don't have any bookings yet"));
      },
    );
  }
}
