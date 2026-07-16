import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/features/confirmation/widget/custom_button_widget.dart';
import 'package:aura_luxury_reservations/features/confirmation/widget/qr_ticket_widget.dart';
import 'package:aura_luxury_reservations/features/confirmation/widget/tiecket_info_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticketcher/ticketcher.dart';

class ConfirmationScreen extends StatelessWidget {
  final String restaurantName;
  final String date;
  final String time;
  final int guestsCount;

  const ConfirmationScreen({
    super.key,
    required this.restaurantName,
    required this.date,
    required this.time,
    required this.guestsCount,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    final ticketWidth = (screenWidth * 0.88).clamp(280.0, 450.0);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBarWidget(isHome: false),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.outlineVariant,
                      ),
                      child: Icon(
                        Icons.check_circle_outline,
                        color: AppColors.primary,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Reservation Confirmed",
                      style: AppStyle.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "Your evening at $restaurantName is secured. We look forward to providing you with an unforgettable culinary journey.",
                        style: AppStyle.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Ticketcher(
                        width: ticketWidth,
                        decoration: TicketcherDecoration(
                          backgroundColor: Colors.black,
                          notchStyle: const NotchStyle.semicircle(radius: 12),
                          borderGradient: LinearGradient(
                            colors: [AppColors.primary, AppColors.black],
                          ),
                          borderWidth: 2,
                          divider: TicketDivider.dashed(
                            color: AppColors.primary,
                            dashWidth: 4,
                            dashSpace: 5,
                          ),
                        ),
                        sections: [
                          Section(
                            padding: EdgeInsets.zero,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(35),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 1.2,
                                      child: Image.asset(
                                        "assets/images/confirm_card_bg.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Container(
                                        color: Colors.black.withValues(
                                          alpha: .75,
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Confirmed Entry",
                                                  style: AppStyle.headlineSmall
                                                      .copyWith(
                                                        color:
                                                            AppColors.primary,
                                                        fontSize: 14,
                                                      ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  restaurantName,
                                                  style: AppStyle.headlineLarge
                                                      .copyWith(
                                                        color: AppColors.white,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: TicketInfoWidget(
                                                        title: "Date",
                                                        info: date,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TicketInfoWidget(
                                                        title: "Time",
                                                        info: time,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 12),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: TicketInfoWidget(
                                                        title: "Table",
                                                        info: "Window 12",
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TicketInfoWidget(
                                                        title: "Guests",
                                                        info: guestsCount < 10
                                                            ? "0$guestsCount Persons"
                                                            : "$guestsCount Persons",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Section(
                            padding: EdgeInsets.zero,
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 16.0,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  QrTicketWidget(reservationId: "LUX-483291"),
                                  const SizedBox(height: 16),
                                  Text(
                                    "LUX-483291",
                                    style: AppStyle.headlineSmall.copyWith(
                                      color: AppColors.white,
                                      letterSpacing: 3,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Scan upon arrival",
                                    style: AppStyle.bodySmall.copyWith(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: ticketWidth,
                      child: CustomButtomWidget(
                        title: 'Ok',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/home");
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
