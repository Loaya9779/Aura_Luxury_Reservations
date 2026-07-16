import 'package:aura_luxury_reservations/core/data_source/firebase_data_source.dart';
import 'package:aura_luxury_reservations/features/home/cubit/satates.dart';
import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  final FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  List<ResturantModel> restaurants = [];
  List<ResturantModel> _allRestaurants = [];
  List<ResturantModel> searchResults = [];

  Future<void> getRestaurants() async {
    emit(HomeLoading());

    try {
      restaurants = await firebaseDataSource.getResturants();

      _allRestaurants = restaurants;

      emit(HomeSuccess(restaurants: restaurants));
    } catch (e) {
      emit(HomeError(errorMessage: e.toString()));
    }
  }
  void searchRestaurants(String query) {
    if (query.trim().isEmpty) {
      searchResults = [];
    } else {
      searchResults = _allRestaurants.where((restaurant) {
        return restaurant.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    emit(HomeSuccess(restaurants: restaurants));
  }
}
