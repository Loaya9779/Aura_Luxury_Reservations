import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/features/onBoarding/model/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel onboardingModel;
  const OnboardingItem({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Text(onboardingModel.headline1, style: AppStyle.headlineExtraLarge),
        Text(onboardingModel.headline2, style: AppStyle.labelExtraLarge),
        Text(onboardingModel.headline3, style: AppStyle.labelExtraLarge),
        SizedBox(height: height * 0.01),
        Text(
          onboardingModel.describtion,
          textAlign: TextAlign.center,
          style: AppStyle.bodyLarge.copyWith(fontFamily: "Inter"),
        ),
      ],
    );
  }
}
