import 'package:aura_luxury_reservations/features/onBoarding/cubit/onboarding_cubit.dart';
import 'package:aura_luxury_reservations/features/onBoarding/cubit/states.dart';
import 'package:aura_luxury_reservations/features/onBoarding/widgets/animated_dot_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedDots extends StatelessWidget {
  const AnimatedDots({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      width: 50,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return BlocBuilder<OnboardingCubit, OnboardingStates>(
            builder: (context, state) {
              return AnimatedDotContainer(
                isSelected: state.currentPage == index,
              );
            },
          );
        },
      ),
    );
  }
}
