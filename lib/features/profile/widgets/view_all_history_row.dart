import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/features/Navigation/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewAllHistoryRow extends StatelessWidget {
  const ViewAllHistoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Reservation History", style: AppStyle.headlineMedium),
        TextButton(
          onPressed: () {
            context.read<NavigationCubit>().changeIndex(1);
          },
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          child: Text("VIEW ALL", style: AppStyle.labelSmall),
        ),
      ],
    );
  }
}
