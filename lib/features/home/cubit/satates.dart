sealed class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}
class HomeSuccess extends HomeStates {
 // final List<RestaurantModel> restaurants;
//HomeSuccess({required this.restaurants});
}

class HomeError extends HomeStates {
  final String errorMessage;
  HomeError({required this.errorMessage});
}
