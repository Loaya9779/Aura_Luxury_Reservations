import 'package:flutter/material.dart';

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
        height: 220,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}