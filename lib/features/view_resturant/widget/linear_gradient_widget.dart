import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinearGradientWidget extends StatelessWidget {
  const LinearGradientWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withValues(alpha: .45),
          ],
        ),
      ),
    );
  }
}

