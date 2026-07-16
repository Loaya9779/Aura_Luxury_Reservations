import 'package:aura_luxury_reservations/features/onBoarding/cubit/onboarding_cubit.dart';
import 'package:aura_luxury_reservations/features/onBoarding/helper/onboarding_items.dart';
import 'package:aura_luxury_reservations/features/onBoarding/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextPageViewBuilder extends StatefulWidget {
  const TextPageViewBuilder({super.key});

  @override
  State<TextPageViewBuilder> createState() => _TextPageViewBuilderState();
}

class _TextPageViewBuilderState extends State<TextPageViewBuilder> {
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
    return SizedBox(
      height: 350.h,
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
    );
  }
}
