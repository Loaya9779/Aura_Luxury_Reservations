import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';
import 'package:flutter/material.dart';

class SearchResultCardWidget extends StatelessWidget {
  final ResturantModel restaurant;

  const SearchResultCardWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(restaurant.image)),
        title: Text(restaurant.name),
        subtitle: Text(restaurant.description),
      ),
    );
  }
}
