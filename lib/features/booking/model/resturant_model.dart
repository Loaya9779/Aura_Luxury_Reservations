import 'package:cloud_firestore/cloud_firestore.dart';

class ResturantModel {
  final String? id;
  final String name;
  final String image;
  final String description;
  final String? guestCount;
  final String? date;
  final String? time;

  ResturantModel({
    this.id,
    required this.name,
    required this.image,
    required this.description,
    this.date,
    this.time,
    this.guestCount,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
    'description': description,
    'guestCount': guestCount,
    'date': date,
    'time': time,
  };

 factory ResturantModel.fromFirestore(DocumentSnapshot doc) {
  final json = doc.data() as Map<String, dynamic>;

  return ResturantModel(
    id: doc.id,
    name: json['name'] as String,
    image: json['image'],
    description: json['description'] as String,
    guestCount: json['guestCount'] as String?,
    date: json['date'] as String?,
    time: json['time'] as String?,
  );
}
}
