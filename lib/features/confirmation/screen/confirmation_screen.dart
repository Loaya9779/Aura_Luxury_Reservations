import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/features/home/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticketcher/ticketcher.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBarWidget(isHome: false),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Ticketcher(
                decoration: TicketcherDecoration(
                  notchStyle: const NotchStyle.semicircle(radius: 10),
                  borderGradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.black],
                  ),
                  borderWidth: 2,
                  divider: TicketDivider.dashed(
                    color: AppColors.black,
                    dashWidth: 6,
                    dashSpace: 4,
                  ),
                ),
                sections: [
                  Section(
                    child: Column(
                      children: [
                        Text("Confirmed"),
                        SizedBox(height: 8),
                        Text("Menla Pove Restaurant"),
                      ],
                    ),
                  ),
                  Section(child: Text("Datatatatatat")),
                  Section(child: Text("Datatatatatat")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
