import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key, required this.onChanged, required this.controller, required this.focusNode,
  });
    final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      focusNode: focusNode,
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
