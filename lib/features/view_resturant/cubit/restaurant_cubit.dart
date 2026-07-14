import 'package:aura_luxury_reservations/core/data_source/firebase_data_source.dart';
import 'package:aura_luxury_reservations/features/view_resturant/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResturantCubit extends Cubit<ResturantState> {
  ResturantCubit() : super(ResturantInitial());

  final FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  Future<void> getResturants() async {
    emit(ResturantLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final restaurants = await firebaseDataSource.getResturants();

      emit(ResturantSuccess(resturants: restaurants));
    } catch (e) {
      emit(ResturantError(error: e.toString()));
    }
  }
}
