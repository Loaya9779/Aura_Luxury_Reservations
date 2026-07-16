import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/features/my_bookings/widgets/fade_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookHistoryRow extends StatelessWidget {
  const BookHistoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.w),
      child: Row(
        children: [
          Expanded(child: FadeLine(isLeft: true)),
          Text("Booking History", style: AppStyle.labelRegular),
          Expanded(child: FadeLine(isLeft: false)),
        ],
      ),
    );
  }
}
