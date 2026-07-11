import 'package:aura_luxury_reservations/features/booking/model/resturant_model.dart';

sealed class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {
  final List<ResturantModel> bookings;
  BookingSuccess({required this.bookings});
}

class BookingError extends BookingState {
  final String error;
  BookingError({required this.error});
}

class BookingUpdated extends BookingState{}