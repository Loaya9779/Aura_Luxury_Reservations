import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/features/Navigation/screen/navigation_screen.dart';
import 'package:aura_luxury_reservations/features/onBoarding/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        final bool isLoggedIn = Hive.box(
          'appBox',
        ).get('isLoggedIn', defaultValue: false);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => isLoggedIn
                ? const NavigationScreen()
                : const OnboardingScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/splash.png', fit: BoxFit.cover),

          Container(color: Colors.black.withValues(alpha: 0.70)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const Spacer(),

                  Text(
                    'LUMIÈRE',
                    style: GoogleFonts.hankenGrotesk(
                      color: AppColors.primary,
                      fontSize: 40,
                      letterSpacing: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: size.height * 0.013),

                  Text(
                    'THE ART OF DINING',
                    style: TextStyle(
                      color: AppColors.secondarySplash,
                      fontSize: 16,
                      letterSpacing: 2,
                      wordSpacing: 4,
                    ),
                  ),

                  const Spacer(),

                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return SizedBox(
                        width: size.width * 0.6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            value: _controller.value,
                            minHeight: 2,
                            backgroundColor: Colors.white.withValues(
                              alpha: 0.15,
                            ),
                            valueColor: const AlwaysStoppedAnimation(
                              AppColors.primary,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: size.height * 0.02),

                  const Text(
                    "Loading Elegance...",
                    style: TextStyle(color: AppColors.primary, fontSize: 16),
                  ),

                  SizedBox(height: size.height * 0.01),

                  Text(
                    "PREPARING YOUR CURATED EXPERIENCE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.secondarySplash.withValues(alpha: 0.9),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  ),

                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
