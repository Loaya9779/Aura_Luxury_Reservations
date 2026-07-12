import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_buttom.dart';
import 'package:aura_luxury_reservations/features/onBoarding/cubit/onboarding_cubit.dart';
import 'package:aura_luxury_reservations/features/onBoarding/cubit/states.dart';
import 'package:aura_luxury_reservations/features/onBoarding/helper/onboarding_items.dart';
import 'package:aura_luxury_reservations/features/onBoarding/widgets/animated_dot_container.dart';
import 'package:aura_luxury_reservations/features/onBoarding/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding_background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("LUMIÈRE", style: AppStyle.labelLarge),
                SizedBox(height: height * 0.25),
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: context.read<OnboardingCubit>().setPage,
                    itemCount: OnboardingItems.onboardingItems.length,
                    itemBuilder: (context, index) {
                      return OnboardingItem(
                        onboardingModel: OnboardingItems.onboardingItems[index],
                      );
                    },
                  ),
                ),
                SizedBox(
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
                ),
                SizedBox(height: 30),
                CustomButtom(title: "Get Started", onPressed: () {}),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a member?", style: AppStyle.bodySmall),
                    TextButton(
                      onPressed: () {},
                      child: Text("SIGN IN", style: AppStyle.labelMedium),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
