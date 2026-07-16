import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_app_bar.dart';
import 'package:aura_luxury_reservations/features/profile/widgets/custom_list_tile.dart';
import 'package:aura_luxury_reservations/features/profile/widgets/profile_booking_history_container.dart';
import 'package:aura_luxury_reservations/features/profile/widgets/profile_picture_widget.dart';
import 'package:aura_luxury_reservations/features/profile/widgets/view_all_history_row.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isCenter: true),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfilePicture(),
              SizedBox(height: 20),
              Text(
                "Alexander Van der Bellen",
                style: AppStyle.headlineLarge,
                textAlign: TextAlign.center,
              ),
              Text("PLATINUM MEMBER SINCE 2021", style: AppStyle.labelMedium),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 20),
                child: Divider(color: AppColors.gold),
              ),
              ViewAllHistoryRow(),
              ProfileBookingHistoryContainer(),
              SizedBox(height: 20),
              Row(children: [Text("Settings", style: AppStyle.headlineMedium)]),
              SizedBox(height: 20),
              Container(
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
