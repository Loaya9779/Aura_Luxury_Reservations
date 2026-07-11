import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_app_bar.dart';
import 'package:aura_luxury_reservations/features/booking/cubit/booking_cubit.dart';
import 'package:aura_luxury_reservations/features/booking/cubit/satates.dart';
import 'package:aura_luxury_reservations/features/booking/details_resturant/widgets/booking_date_time.dart';
import 'package:aura_luxury_reservations/features/booking/details_resturant/widgets/booking_image.dart';
import 'package:aura_luxury_reservations/features/booking/details_resturant/widgets/booking_info.dart';
import 'package:aura_luxury_reservations/features/booking/details_resturant/widgets/guest_counter.dart';
import 'package:aura_luxury_reservations/features/booking/model/resturant_model.dart';
import 'package:aura_luxury_reservations/features/booking/view_resturant/widget/custom_buttom_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingDetailsScreen extends StatelessWidget {
  final ResturantModel restaurant;

  const BookingDetailsScreen({super.key, required this.restaurant});

  Future<void> _pickDate(BuildContext context, BookingCubit cubit) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      cubit.changeDate(date);
    }
  }

  Future<void> _pickTime(BuildContext context, BookingCubit cubit) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      cubit.changeTime(time);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BookingCubit>();

    return BlocListener<BookingCubit, BookingState>(
      listener: (context, state) {
        if (state is BookingCompleted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Reservation Confirmed")),
          );

          Navigator.pop(context, true);
        }

        if (state is BookingError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(isCenter: true),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookingImage(image: restaurant.image),

              const SizedBox(height: 20),

              BookingInfo(
                name: restaurant.name,
                description: restaurant.description,
              ),

              const SizedBox(height: 30),

              BookingDateTime(
                selectedDate: cubit.selectedDate,
                selectedTime: cubit.selectedTime,
                onDateTap: () => _pickDate(context, cubit),
                onTimeTap: () => _pickTime(context, cubit),
              ),

              const SizedBox(height: 30),

              GuestCounter(
                guests: cubit.guests,
                onAdd: cubit.increaseGuests,
                onRemove: cubit.decreaseGuests,
              ),

              const SizedBox(height: 40),

              CustomButtomBook(
                title: 'Confirm Booking',
                onPressed: () {
                  if (cubit.selectedDate == null ||
                      cubit.selectedTime == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Choose date and time")),
                    );
                    return;
                  }

                  cubit.bookRestaurant(
                    restaurant: restaurant,
                    date: cubit.selectedDate!,
                    time: cubit.selectedTime!,
                    guests: cubit.guests,
                    context: context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
