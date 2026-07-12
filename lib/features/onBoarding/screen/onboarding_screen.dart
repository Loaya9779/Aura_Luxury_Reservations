import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_buttom.dart';
import 'package:aura_luxury_reservations/features/onBoarding/helper/onboarding_items.dart';
import 'package:aura_luxury_reservations/features/onBoarding/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
              children: [
                Text("LUMIÈRE", style: AppStyle.labelLarge),
                SizedBox(height: height * 0.3),
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {},
                    itemCount: OnboardingItems.onboardingItems.length,
                    itemBuilder: (context, index) {
                      return OnboardingItem(
                        onboardingModel: OnboardingItems.onboardingItems[index],
                      );
                    },
                  ),
                ),

                CustomButtom(title: "Get Started", onPressed: () {}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a member? ", style: AppStyle.bodySmall),
                    Text(" SIGN IN", style: AppStyle.labelMedium),
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
