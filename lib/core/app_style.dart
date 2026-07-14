import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyle {
  /// Headline (Hanken Grotesk)

  static TextStyle headlineExtraLarge = GoogleFonts.hankenGrotesk(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.6,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineLarge = GoogleFonts.hankenGrotesk(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.6,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineMedium = GoogleFonts.hankenGrotesk(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.3,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static TextStyle headlineSmall = GoogleFonts.hankenGrotesk(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: AppColors.textPrimary,
  );
  static TextStyle headlineExtraSmall = GoogleFonts.hankenGrotesk(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  /// Body (Inter)

  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.textSecondary,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static TextStyle bodyExtraSmall = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  /// Label (Inter)

  static TextStyle labelExtraLarge = GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
    color: AppColors.primary,
  );

  static TextStyle labelLarge = GoogleFonts.inter(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
    color: AppColors.primary,
  );

  static TextStyle labelRegular = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
    color: AppColors.primary,
  );

  static TextStyle labelMedium = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
    color: AppColors.primary,
  );

  static TextStyle labelSmall = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
    color: AppColors.primary,
  );
}
