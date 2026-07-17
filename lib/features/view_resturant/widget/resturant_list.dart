import 'package:aura_luxury_reservations/features/view_resturant/cubit/restaurant_cubit.dart';
import 'package:aura_luxury_reservations/features/view_resturant/cubit/states.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/restaurant_card_widget.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/restaurant_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResturantList extends StatelessWidget {
  const ResturantList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResturantCubit, ResturantState>(
      builder: (context, state) {
        if (state is ResturantLoading) {
          return const RestaurantShimmer();
        }

        if (state is ResturantError) {
          return Center(child: Text(state.error));
        }

        if (state is ResturantSuccess) {
          return ListView.builder(
            itemCount: state.resturants.length,
            itemBuilder: (_, index) {
              return RestaurantCard(
                restaurant: state.resturants[index],
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}