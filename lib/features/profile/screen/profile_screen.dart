import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/core/widgets/app_bar_widget.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_app_bar.dart';
import 'package:aura_luxury_reservations/features/auth/cubit/auth_cubit.dart';
import 'package:aura_luxury_reservations/features/auth/cubit/states.dart';
import 'package:aura_luxury_reservations/features/profile/widgets/profile_booking_history_listview.dart';
import 'package:aura_luxury_reservations/features/profile/widgets/profile_picture_widget.dart';
import 'package:aura_luxury_reservations/features/profile/widgets/settings_container.dart';
import 'package:aura_luxury_reservations/features/profile/widgets/view_all_history_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isCenter: true),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(25.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfilePicture(),
              SizedBox(height: 20.h),
              BlocBuilder<AuthCubit, AuthStates>(
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return CircularProgressIndicator();
                  } else if (state is LogInSuccessState) {
                    return Text(
                      state.userModel.name,
                      style: AppStyle.headlineLarge,
                      textAlign: TextAlign.center,
                    );
                  }
                  return SizedBox();
                },
              ),
              Text("PLATINUM MEMBER SINCE 2021", style: AppStyle.labelMedium),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 20),
                child: Divider(color: AppColors.gold),
              ),
              ViewAllHistoryRow(),
              ProfileBookingHistoryListview(),
              SizedBox(height: 20.h),
              Row(children: [Text("Settings", style: AppStyle.headlineMedium)]),
              SizedBox(height: 20.h),
              SettingsContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
