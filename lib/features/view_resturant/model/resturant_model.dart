import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  final String? id;
  final String name;
  final String image;
  final String description;
  final String location;
  final String rating;

  RestaurantModel({
    this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.location,
    required this.rating,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
    'description': description,
    'location': location,
    'rating': rating,
  };

  factory ResturantModel.fromJson(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>;

    return ResturantModel(
      id: doc.id,
      name: json['name'] as String,
      image: json['image'],
      description: json['description'] as String,
      location: json['location'] as String,
      rating: json['rating'] as String,
    );
  }
}
