sealed class NavigationStates {
  final int currentIndex;

  NavigationStates({required this.currentIndex});
}

class NavigationInitialState extends NavigationStates {
  NavigationInitialState({required super.currentIndex});
}

class NavigationChangeState extends NavigationStates {
  NavigationChangeState({required super.currentIndex});
}
