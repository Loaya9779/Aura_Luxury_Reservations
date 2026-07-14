import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';
import 'package:flutter/material.dart';

class BookingModel {
  final ResturantModel restaurant;
  final DateTime date;
  final TimeOfDay time;
  final int guestCount;

  BookingModel({
    required this.restaurant,
    required this.date,
    required this.time,
    required this.guestCount,
  });

  Map<String, dynamic> toJson() {
    return {
      "restaurant": restaurant.toJson(),
      "date": date.toIso8601String(),
      "time": {
        "hour": time.hour,
        "minute": time.minute,
      },
      "guestCount": guestCount,
    };
  }

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      restaurant: ResturantModel.fromJson(json["restaurant"]),
      date: DateTime.parse(json["date"]),
      time: TimeOfDay(
        hour: json["time"]["hour"],
        minute: json["time"]["minute"],
      ),
      guestCount: json["guestCount"],
    );
  }
}