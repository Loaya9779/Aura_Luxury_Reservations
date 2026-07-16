import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingImage extends StatelessWidget {
  final String image;

  const BookingImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        image,
        
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}