import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookNowButtonWidget extends StatelessWidget {
  const BookNowButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.r),
      width: 110.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: const Color(0xff3B3521),
        borderRadius: BorderRadius.circular(26.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BOOK NOW",
              style: TextStyle(
                color: Color(0xffE5C75D),
                fontSize: 9.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            SizedBox(width: 5.w),
    
            Icon(
              Icons.arrow_forward,
              color: Color(0xffE5C75D),
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
