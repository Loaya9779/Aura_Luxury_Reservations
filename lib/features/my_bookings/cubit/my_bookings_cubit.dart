import 'package:aura_luxury_reservations/core/data_source/firebase_data_source.dart';
import 'package:aura_luxury_reservations/features/details_resturant/model/booking_model.dart';
import 'package:aura_luxury_reservations/features/my_bookings/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBookingsCubit extends Cubit<MyBookingsState> {
  MyBookingsCubit() : super(MybookingsInitialState());

  final FirebaseDataSource _firebaseDataSource = FirebaseDataSource();

  Future<void> getUserBookings() async {
    emit(MybookingsLoadingState());
    try {
      List<BookingModel> myBookings = await _firebaseDataSource
          .getUserBookings();
      emit(MybookingsSuccessState(mybookings: myBookings));
    } catch (e) {
      emit(MybookingsErrorState(errorMessage: e.toString()));
    }
  }
}
