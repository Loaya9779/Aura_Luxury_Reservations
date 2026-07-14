import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';

sealed class ResturantState {}

class ResturantInitial extends ResturantState {}

class ResturantLoading extends ResturantState {}

class ResturantSuccess extends ResturantState {
  final List<RestaurantModel> resturants;
  ResturantSuccess({required this.resturants});
}

class ResturantCompleted extends ResturantState {}

class ResturantError extends ResturantState {
  final String error;
  ResturantError({required this.error});
}

class ResturantUpdated extends ResturantState {}
