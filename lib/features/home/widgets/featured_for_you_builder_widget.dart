import 'package:aura_luxury_reservations/features/home/cubit/home_cubit.dart';
import 'package:aura_luxury_reservations/features/home/cubit/satates.dart';
import 'package:aura_luxury_reservations/features/home/widgets/restaurant_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedForYouBuilderWidget extends StatelessWidget {
  const FeaturedForYouBuilderWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeError) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is HomeSuccess) {
          return SizedBox(
            height: height * 0.35,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return RestaurantCardWidget(
                  width: width,
                  height: height,
                  resturant: state.restaurants[index],
                );
              },
              separatorBuilder:
                  (BuildContext context, int index) {
                    return SizedBox(width: width * 0.03);
                  },
              itemCount: state.restaurants.length,
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
