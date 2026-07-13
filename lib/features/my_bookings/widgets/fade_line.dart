import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';

class FadeLine extends StatelessWidget {
  final bool isLeft;
  const FadeLine({super.key, required this.isLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: isLeft ? Alignment.centerLeft : Alignment.centerRight,
          end: isLeft ? Alignment.centerRight : Alignment.centerLeft,
          colors: [AppColors.primary, Colors.transparent],
        ),
      ),
    );
  }
}
