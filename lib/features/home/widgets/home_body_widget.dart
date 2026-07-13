import 'package:aura_luxury_reservations/features/home/cubit/home_cubit.dart';
import 'package:aura_luxury_reservations/features/home/widgets/divider_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/featured_for_you_builder_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/home_title_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/search_textfield_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/trending_now_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    super.key,
    required this._controller,
    required this._focusNode,
    required this.height,
    required this.width,
  });

  final TextEditingController _controller;
  final FocusNode _focusNode;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
            FeaturedForYouBuilderWidget(height: height, width: width),
            DividerWidget(height: height),
            HomeTitleWidget(
              width: width,
              height: height,
              title: 'Trending Now 🔥',
              subtitle: 'Trending Restaurants nowadays',
            ),
            SizedBox(height: height * 0.03),
    
            TrendingNowBuilderWidget(width: width, height: height),
          ],
        ),
      ],
    );
  }
}
