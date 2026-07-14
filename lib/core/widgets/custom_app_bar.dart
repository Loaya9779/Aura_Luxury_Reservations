import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? icon;
  final bool isCenter;
  final VoidCallback? onTap;
  const CustomAppBar({
    super.key,
    this.icon,
    required this.isCenter,
   this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text('LUMIÈRE', style: AppStyle.labelLarge),
        centerTitle: isCenter,
        leading: icon,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
