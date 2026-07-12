import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/features/home/cubit/home_cubit.dart';
import 'package:aura_luxury_reservations/features/home/cubit/satates.dart';
import 'package:aura_luxury_reservations/features/home/widgets/app_bar_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/home_title_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/restaurant_card_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/search_results_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/search_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.surface,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AppBarWidget(),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchTextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        onChanged: (String value) {
                          context.read<HomeCubit>().searchRestaurants(value);
                        },
                      ),
                      SizedBox(height: height * 0.02),

                      SizedBox(height: height * 0.01),
                      HomeTitleWidget(
                        width: width,
                        height: height,
                        title: 'Featured For You',
                        subtitle: 'Selected for your exquisite taste',
                        buttonText: "View All",
                        onTap: () {
                          Navigator.pushNamed(context, "/resturants");
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      BlocBuilder<HomeCubit, HomeStates>(
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
                      ),
                      SizedBox(height: height * 0.03),
                      Divider(color: AppColors.primary),
                      SizedBox(height: height * 0.02),
                      HomeTitleWidget(
                        width: width,
                        height: height,
                        title: 'Trending Now 🔥',
                        subtitle: 'Trending Restaurants nowadays',
                      ),
                      SizedBox(height: height * 0.03),

                      BlocBuilder<HomeCubit, HomeStates>(
                        builder: (context, state) {
                          if (state is HomeError) {
                            return Text(state.errorMessage);
                          }
                          if (state is HomeSuccess) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Center(
                                  child: RestaurantCardWidget(
                                    width: width,
                                    height: height,
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SearchResultsWidget(focusNode: _focusNode),
          ],
        ),
      ),
    );
  }
}
