import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: AppStyle.bodyMedium,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyle.bodySmall,
        labelText: labelText,
        labelStyle: AppStyle.bodySmall,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        filled: true,
        fillColor: Colors.black.withValues(alpha: 0.5),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),

        border: _border(),
        enabledBorder: _border(color: AppColors.textSecondary),
        focusedBorder: _border(color: AppColors.primary, width: 2),
        errorBorder: _border(color: Colors.red),
        focusedErrorBorder: _border(color: Colors.red, width: 2),
      ),
    );
  }

  OutlineInputBorder _border({
    Color color = AppColors.textSecondary,
    double width = 1,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
