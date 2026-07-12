import 'package:aura_luxury_reservations/core/data_source/firebase_data_source.dart';
import 'package:aura_luxury_reservations/features/home/cubit/satates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitial());


  final FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  Future<void> getRestaurants() async {
    emit(HomeLoading());

    // try {
    //   final restaurants =
    //       await firebaseDataSource.getResturants();

    //   emit(HomeSuccess(restaurants:restaurants));
    // } catch (e) {
    //   emit(HomeError(errorMessage: e.toString()));
    // }
  }
}