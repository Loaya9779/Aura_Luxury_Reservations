import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/features/details_resturant/screen/booking_details_screen.dart';
import 'package:aura_luxury_reservations/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({super.key, required this.focusNode});

  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    final results = context.watch<HomeCubit>().searchResults;

    if (!focusNode.hasFocus || results.isEmpty) {
      return const SizedBox.shrink();
    }

    return Positioned(
      top: 90.h,
      left: 24.w,
      right: 24.w,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.surfaceContainer,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 300.h),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: results.length,
            padding: EdgeInsets.all(8.w),

            itemBuilder: (_, index) {
              final restaurant = results[index];

              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    restaurant.image,
                    width: 55.w,
                    height: 55.h,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  restaurant.name,
                  style: AppStyle.headlineExtraSmall,
                ),
                subtitle: Text(restaurant.location, style: AppStyle.bodySmall),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          BookingDetailsScreen(restaurant: restaurant),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
