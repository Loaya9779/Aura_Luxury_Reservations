import 'package:aura_luxury_reservations/features/home/cubit/home_cubit.dart';
import 'package:aura_luxury_reservations/features/home/cubit/satates.dart';
import 'package:aura_luxury_reservations/features/home/widgets/restaurant_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendingNowBuilderWidget extends StatelessWidget {
  const TrendingNowBuilderWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is HomeError) {
          return Text(state.errorMessage);
        }
        if (state is HomeLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is HomeSuccess) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: RestaurantCardWidget(
                  width: width.w,
                  height: height.h,
                  resturant: state.restaurants[index],
                  isTrending: true,
                ),
              );
            },
            separatorBuilder:
                (BuildContext context, int index) {
                  return SizedBox(height: height * 0.03);
                },
            itemCount: state.restaurants.length,
          );
        }
        return SizedBox();
      },
    );
  }
}
