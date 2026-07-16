import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/splash.png'),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.primary,
              size: 30,
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size(1, 15),
        child: Container(
          color: AppColors.primary.withValues(alpha: 0.15),
          height: 1,
        ),
      ),
      backgroundColor: AppColors.surface,
      title: Text(
        'LUMIÈRE',
        style: GoogleFonts.hankenGrotesk(
          color: AppColors.primary,
          fontSize: 32,
          fontWeight: FontWeight.w500,
          letterSpacing: 4,
        ),
      ),
    );
  }
}
