sealed class OnboardingStates {
  final int currentPage;

  OnboardingStates({required this.currentPage});
}

class OnbaordingInitialState extends OnboardingStates {
  OnbaordingInitialState({required super.currentPage});
}

class OnboardingDotTransitionState extends OnboardingStates {
  OnboardingDotTransitionState({required super.currentPage});
}
