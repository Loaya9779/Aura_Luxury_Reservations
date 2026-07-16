import 'package:aura_luxury_reservations/core/data_source/firebase_data_source.dart';
import 'package:aura_luxury_reservations/features/details_resturant/cubit/satates.dart';
import 'package:aura_luxury_reservations/features/details_resturant/model/booking_model.dart';
import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  final FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int guests = 1;

  Future<void> confirmBooking({
    required ResturantModel restaurant,
    required BuildContext context,
  }) async {
    if (selectedDate == null || selectedTime == null) {
      emit(BookingError(error: "Choose date and time"));
      return;
    }

    emit(BookingLoading());

    try {
      await firebaseDataSource.bookRestaurant(
        context: context,
        booking: BookingModel(
          restaurant: restaurant,
          status: "",
          date: selectedDate!,
          time: selectedTime!,
          guestCount: guests,
        ),
      );

      emit(
        BookingCompleted(
          date: selectedDate!,
          time: selectedTime!,
          guests: guests,
        ),
      );
      resetBooking();
    } catch (e) {
      emit(BookingError(error: e.toString()));
    }
  }

  void changeDate(DateTime date) {
    selectedDate = date;
    emit(BookingUpdated());
  }

  void changeTime(TimeOfDay time) {
    selectedTime = time;
    emit(BookingUpdated());
  }

  void increaseGuests() {
    guests++;
    emit(BookingUpdated());
  }

  void decreaseGuests() {
    if (guests > 1) {
      guests--;
      emit(BookingUpdated());
    }
  }

  void resetBooking() {
    selectedDate = null;
    selectedTime = null;
    guests = 1;
    emit(BookingInitial());
  }
}
