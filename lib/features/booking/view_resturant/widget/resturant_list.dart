
import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/features/booking/details_resturant/screen/booking_details_screen.dart';
import 'package:aura_luxury_reservations/features/booking/view_resturant/cubit/resturant_cubit.dart';
import 'package:aura_luxury_reservations/features/booking/view_resturant/cubit/satates.dart';
import 'package:aura_luxury_reservations/features/booking/view_resturant/widget/custom_buttom_book.dart';
import 'package:aura_luxury_reservations/features/booking/view_resturant/widget/restaurant_shimmer.dart';
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

        if (state is ResturantSuccess) {
          return ListView.builder(
            itemCount: state.resturants.length,
            itemBuilder: (context, index) {
              final restaurant = state.resturants[index];

              return Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceHigh,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(restaurant.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(restaurant.name, style: AppStyle.headlineSmall),
                    const SizedBox(height: 5),
                    CustomButtomBook(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                BookingDetailsScreen(restaurant: restaurant),
                          ),
                        );
                      },
                      title: 'VIEW DETAILS',
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
