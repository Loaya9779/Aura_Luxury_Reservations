import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/features/details_resturant/screen/booking_details_screen.dart';
import 'package:aura_luxury_reservations/features/view_resturant/cubit/restaurant_cubit.dart';
import 'package:aura_luxury_reservations/features/view_resturant/cubit/states.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/restaurant_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResturantList extends StatelessWidget {
  const ResturantList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResturantCubit, ResturantState>(
      builder: (context, state) {
        if (state is ResturantLoading) {
          return const RestaurantShimmer();
        }

        if (state is ResturantSuccess) {
          return ListView.builder(
            itemCount: state.resturants.length,
            itemBuilder: (context, index) {
              final restaurant = state.resturants[index];

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: const Color(0xff171717),
                  borderRadius: BorderRadius.circular(28.r),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: .08),
                  ),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(28.r),
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 260.h,
                            width: double.infinity,
                            child: Image.network(
                              restaurant.image,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Container(
                            height: 260.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: .45),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(18.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                    vertical: 6.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: .35),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Text(
                                    restaurant.category,
                                    style: TextStyle(
                                      color: Color(0xffE5C75D),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.w,
                                    vertical: 6.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: .35),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xffE5C75D),
                                        size: 15,
                                      ),
                                      SizedBox(width: 6.w),
                                      Text(
                                        restaurant.rating.toString(),
                                        style: TextStyle(
                                          color: Color(0xffE5C75D),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(12.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant.location.toUpperCase(),
                                    style: AppStyle.labelSmall,
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    restaurant.name,
                                    style: AppStyle.headlineMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BookingDetailsScreen(
                                    restaurant: restaurant,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(8.r),
                              width: 110.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: const Color(0xff3B3521),
                                borderRadius: BorderRadius.circular(26.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.r),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "BOOK NOW",
                                      style: TextStyle(
                                        color: Color(0xffE5C75D),
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),

                                    Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xffE5C75D),
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }

        if (state is ResturantError) {
          return Center(child: Text(state.error));
        }

        return const SizedBox();
      },
    );
  }
}
