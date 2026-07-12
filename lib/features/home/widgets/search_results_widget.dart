import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/features/home/cubit/home_cubit.dart';
import 'package:aura_luxury_reservations/features/home/cubit/satates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({
    super.key,
    required this.focusNode,
  });

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
          constraints: const BoxConstraints(
            maxHeight: 300,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: results.length,
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
                  restaurant.location ?? "",
                  style: const TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  // Navigate later
                },
              );
            },
          ),
        ),
      ),
    );
  }
}