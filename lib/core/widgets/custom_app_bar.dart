import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? icon;
  final bool isCenter;

  const CustomAppBar({super.key, this.icon, required this.isCenter});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,
      elevation: 0,
      title: Text(
        'LUMIÈRE',
        style: AppStyle.headlineLarge.copyWith(color: AppColors.primary),
      ),
      centerTitle: isCenter,
      leading: icon,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
