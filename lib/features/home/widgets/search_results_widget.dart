import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/features/details_resturant/screen/booking_details_screen.dart';
import 'package:aura_luxury_reservations/features/home/cubit/home_cubit.dart';
import 'package:aura_luxury_reservations/features/home/widgets/search_result_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      top: 95,
      left: 24,
      right: 24,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15),
        color: AppColors.surfaceContainer,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 300),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: results.length,
            padding: EdgeInsets.all(8),

            itemBuilder: (_, index) {
              final restaurant = results[index];

              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    restaurant.image,
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  restaurant.name,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  restaurant.location,
                  style: const TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  //NAV
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
