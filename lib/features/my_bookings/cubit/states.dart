import 'package:aura_luxury_reservations/features/details_resturant/model/booking_model.dart';

sealed class MyBookingsState {}

class MybookingsInitialState extends MyBookingsState {}

class MybookingsLoadingState extends MyBookingsState {}

class MybookingsSuccessState extends MyBookingsState {
  final List<BookingModel> mybookings;

  MybookingsSuccessState({required this.mybookings});
}

class MybookingsErrorState extends MyBookingsState {
  final String errorMessage;

  MybookingsErrorState({required this.errorMessage});
}
