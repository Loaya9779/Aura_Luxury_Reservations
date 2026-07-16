import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/features/details_resturant/screen/booking_details_screen.dart';
import 'package:aura_luxury_reservations/features/view_resturant/cubit/restaurant_cubit.dart';
import 'package:aura_luxury_reservations/features/view_resturant/cubit/states.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/restaurant_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResturantList extends StatelessWidget {
  const ResturantList({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xff171717),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: .08),
                  ),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(28),
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: height * 0.3,
                            width: double.infinity,
                            child: Image.network(
                              restaurant.image,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Container(
                            height: height * 0.3,
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
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Positioned(
                                  top: 16,
                                  right: 16,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: .35,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      restaurant.category,
                                      style: const TextStyle(
                                        color: Color(0xffE5C75D),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 16,
                                  left: 16,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: .35,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xffE5C75D),
                                          size: 15,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          restaurant.rating.toString(),
                                          style: const TextStyle(
                                            color: Color(0xffE5C75D),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant.location.toUpperCase(),
                                    style: AppStyle.labelSmall,
                                  ),
                                  const SizedBox(height: 10),
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
                              margin: EdgeInsets.all(8),
                              width: width * 0.28,
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                color: const Color(0xff3B3521),
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "BOOK NOW",
                                      style: TextStyle(
                                        color: Color(0xffE5C75D),
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    SizedBox(width: width * 0.03),

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
