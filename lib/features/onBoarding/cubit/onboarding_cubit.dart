import 'package:aura_luxury_reservations/features/onBoarding/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit() : super(OnbaordingInitialState(currentPage: 0));

  void setPage(int index) {
    emit(OnboardingDotTransitionState(currentPage: index));
  }
}
