import 'package:aura_luxury_reservations/core/data_source/firebase_data_source.dart';
import 'package:aura_luxury_reservations/features/booking/cubit/satates.dart';
import 'package:aura_luxury_reservations/features/booking/model/resturant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  final FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int guests = 1;

  Future<void> bookRestaurant({
    required ResturantModel restaurant,
    required DateTime date,
    required TimeOfDay time,
    required int guests,
    required BuildContext context,
  }) async {
    emit(BookingLoading());

    try {
      await firebaseDataSource.bookRestaurant(
        restaurant: restaurant,
        date: date,
        time: time,
        guests: guests,
        context: context,
      );

      emit(BookingCompleted());
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