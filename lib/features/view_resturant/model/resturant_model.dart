import 'package:cloud_firestore/cloud_firestore.dart';

class ResturantModel {
  // final String? id;
  final String name;
  final String image;
  final String description;
  final String category;
  final String location;
  final String rating;

  ResturantModel({
    // this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.location,
    required this.rating,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
    'description': description,
    'category': category,
    'location': location,
    'rating': rating,
  };

  factory ResturantModel.fromJson(Map<String, dynamic> json) {
    return ResturantModel(
      // id: doc.id,
      name: json['name'] as String,
      image: json['image'],
      description: json['description'] as String,
      category: json['category'] as String,
      location: json['location'] as String,
      rating: json['rating'] as String,
    );
  }
}
