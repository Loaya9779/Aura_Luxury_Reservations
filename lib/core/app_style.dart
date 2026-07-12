import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyle {
  // ================= Headline =================

  static final TextStyle headlineExtraLarge = GoogleFonts.hankenGrotesk(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static final TextStyle headlineLarge = GoogleFonts.hankenGrotesk(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static final TextStyle headlineMedium = GoogleFonts.hankenGrotesk(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static final TextStyle headlineSmall = GoogleFonts.hankenGrotesk(
    fontSize: 6.sp,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  // ================= Body =================

  static final TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static final TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 8.sp,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static final TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 5.sp,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  // ================= Label =================

  static final TextStyle labelExtraLarge = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
    color: AppColors.primary,
  );

  static final TextStyle labelLarge = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.primary,
  );

  static final TextStyle labelMedium = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.primary,
  );

  static final TextStyle labelSmall = GoogleFonts.inter(
    fontSize: 5.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.primary,
  );
}