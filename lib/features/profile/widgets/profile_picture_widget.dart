import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.bottomRight,
      children: [
        Container(
          width: 150,
          height: 150,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary, width: 2),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/splash.png'),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: Icon(Icons.edit, size: 20, color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
