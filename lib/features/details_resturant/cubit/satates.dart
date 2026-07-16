import 'package:flutter/material.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingUpdated extends BookingState {}

class BookingLoading extends BookingState {}

class BookingCompleted extends BookingState {
  final DateTime date;
  final TimeOfDay time;
  final int guests;

  BookingCompleted({
    required this.date,
    required this.time,
    required this.guests,
  });
}

class BookingError extends BookingState {
  final String error;

  BookingError({required this.error});
}
