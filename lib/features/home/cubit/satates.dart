import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';

sealed class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}
class HomeSuccess extends HomeStates {
  final List<ResturantModel> restaurants;
HomeSuccess( {required this.restaurants});
}


class HomeError extends HomeStates {
  final String errorMessage;
  HomeError({required this.errorMessage});
}
