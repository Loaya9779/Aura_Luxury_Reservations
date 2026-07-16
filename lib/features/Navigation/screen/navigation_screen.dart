import 'package:aura_luxury_reservations/features/Navigation/cubit/navigation_cubit.dart';
import 'package:aura_luxury_reservations/features/Navigation/cubit/states.dart';
import 'package:aura_luxury_reservations/features/Navigation/widgets/custom_bottom_navigation.dart';
import 'package:aura_luxury_reservations/features/home/screen/home_screen.dart';
import 'package:aura_luxury_reservations/features/my_bookings/screen/my_bookings_screen.dart';
import 'package:aura_luxury_reservations/features/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  final List _pages = const [HomeScreen(), MyBookingsScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationStates>(
      builder: (context, state) {
        return Scaffold(
          body: _pages[state.currentIndex],
          bottomNavigationBar: CustomBottomNavigation(
            currentIndex: state.currentIndex,
          ),
        );
      },
    );
  }
}
