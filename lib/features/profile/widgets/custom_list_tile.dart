import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSignout;
  final void Function()? onTap;
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.isSignout,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      iconColor: isSignout ? AppColors.red : AppColors.outline,
      titleTextStyle: isSignout
          ? AppStyle.headlineExtraSmall.copyWith(color: AppColors.red)
          : AppStyle.headlineExtraSmall,
      title: Text(title),
      trailing: isSignout ? null : Icon(Icons.keyboard_arrow_right),
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
    );
  }
}
