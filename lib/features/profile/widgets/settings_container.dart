import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/features/auth/cubit/auth_cubit.dart';
import 'package:aura_luxury_reservations/features/profile/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.surfaceHighest),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CustomListTile(
            icon: Icons.person_outline,
            title: "Personal Information",
            isSignout: false,
          ),
          CustomListTile(
            icon: Icons.notifications_active,
            title: "Preferences",
            isSignout: false,
          ),
          CustomListTile(
            icon: Icons.lock_outline,
            title: "Privacy & Security",
            isSignout: false,
          ),
          CustomListTile(
            icon: Icons.logout,
            title: "Sign Out",
            isSignout: true,
            onTap: () {
              context.read<AuthCubit>().logout();
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/login",
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
