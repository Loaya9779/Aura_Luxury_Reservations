abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingUpdated extends BookingState {}

class BookingLoading extends BookingState {}

class BookingCompleted extends BookingState {}

class BookingError extends BookingState {
  final String error;

  BookingError({required this.error});
}