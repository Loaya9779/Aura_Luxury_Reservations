import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final bool isCenter;

  const CustomAppBar({
    super.key,
    required this.isCenter,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        elevation: 0,
        title: Text('LUMIÈRE', style: AppStyle.labelLarge),
        centerTitle: isCenter,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
