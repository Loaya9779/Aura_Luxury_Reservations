import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_buttom.dart';
import 'package:aura_luxury_reservations/features/onBoarding/widgets/already_member_row.dart';
import 'package:aura_luxury_reservations/features/onBoarding/widgets/animated_dots.dart';
import 'package:aura_luxury_reservations/features/onBoarding/widgets/text_pageview_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding_background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("LUMIÈRE", style: AppStyle.labelLarge),
                  SizedBox(height: 150.h),
                  TextPageViewBuilder(),
                  AnimatedDots(),
                  SizedBox(height: 30),
                  CustomButtom(
                    title: "Get Started",
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, "/signup"),
                  ),
                  SizedBox(height: 15.h),
                  AlreadyMemberRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
