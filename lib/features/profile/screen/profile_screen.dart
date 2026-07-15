import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_app_bar.dart';
import 'package:aura_luxury_reservations/features/profile/widgets/profile_picture_widget.dart';
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
        child: Column(children: [ProfilePicture()]),
      ),
    );
  }
}
