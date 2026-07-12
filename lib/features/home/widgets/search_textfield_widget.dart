import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primary,
      style: GoogleFonts.hankenGrotesk(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: 'Cusine or Restaurant',
        hintStyle: GoogleFonts.hankenGrotesk(
          color: Colors.grey.shade500,
          fontSize: 15,
        ),
    
        prefixIcon: Icon(Icons.search, color: Colors.grey.shade500),
    
        filled: true,
        fillColor: AppColors.surfaceContainer,
    
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
    
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
    
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
    
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
