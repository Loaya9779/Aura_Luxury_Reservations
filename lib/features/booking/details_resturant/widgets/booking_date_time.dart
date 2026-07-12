import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingDateTime extends StatelessWidget {
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;

  final VoidCallback onDateTap;
  final VoidCallback onTimeTap;

  const BookingDateTime({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateTap,
    required this.onTimeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            selectedDate == null
                ? "Choose Date"
                : DateFormat("dd/MM/yyyy").format(selectedDate!),
            style: AppStyle.bodyMedium.copyWith(color: AppColors.primary),
          ),
          trailing: const Icon(Icons.calendar_month, color: AppColors.primary),
          onTap: onDateTap,
        ),
        ListTile(
          title: Text(
            selectedTime == null
                ? "Choose Time"
                : selectedTime!.format(context),
            style: AppStyle.bodyMedium.copyWith(color: AppColors.primary),
          ),
          trailing: const Icon(Icons.access_time, color: AppColors.primary),
          onTap: onTimeTap,
        ),
      ],
    );
  }
}
