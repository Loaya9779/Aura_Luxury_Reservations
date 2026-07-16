import 'package:aura_luxury_reservations/features/Navigation/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationStates> {
  NavigationCubit() : super(NavigationInitialState(currentIndex: 0));

  void changeIndex(int index) {
    emit(NavigationChangeState(currentIndex: index));
  }
}
