import 'package:aura_luxury_reservations/features/auth/model/user_model.dart';
import 'package:aura_luxury_reservations/features/booking/model/resturant_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FirebaseDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUp(
    String email,
    String password,
    String username,
    String phone,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      print("Auth Success");

      UserModel userModel = UserModel(
        email: email,
        name: username,
        id: userCredential.user!.uid,
        phone: phone,
        bookings: [],
      );

      print(userModel.toJson());

      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toJson());

      print("Firestore Success");
    } catch (e) {
      print(e);
    }
  }

  Future<UserModel?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final snapshot = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
    } catch (e) {
      print("firebase: $e");
      return null;
    }
  }

  Future<void> forgetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } catch (e) {
      print("firebase: $e");
    }
  }

  Future<void> addResturants() async {
    final List<ResturantModel> resturants = [
      ResturantModel(
        id: "",
        name: "Mizu Zen",
        image:
            "https://drive.google.com/file/d/1UTFGqPPEljNjkBQvEz4Hy5UZHuxeydSX/view?usp=drive_link",
        description: '''Mizu Zen offers a refined Japanese dining
experience where traditional flavors meet
modern presentation. Enjoy premium sushi,
fresh sashimi, and signature dishes crafted
with the finest ingredients in a peaceful,
elegant atmosphere.''',
      ),
      ResturantModel(
        id: "",
        name: "L'Eclat d'Or",
        image:
            "https://drive.google.com/file/d/1VyxePNQ_WbosNpg4dYsV9GPLvVeo2CGm/view?usp=drive_link",
        description: '''L'Eclat d'Or delivers an exceptional fine
dining experience inspired by classic
French cuisine. Every plate is prepared
with seasonal ingredients, artistic
presentation, and impeccable service
to create unforgettable moments.''',
      ),
      ResturantModel(
        id: "",
        name: "L'Oiseau Bleu Interior",
        image:
            "https://drive.google.com/file/d/1bQldl1o9IorcA0LZ5ytBpa_SHZKXadns/view?usp=drive_link",
        description: '''L'Oiseau Bleu redefines contemporary
French gastronomy under the vision of
Chef Marcelle Vasseur. Every dish is a
silent symphony of seasonal ingredients
sourced from exclusive coastal estates.
The atmosphere is curated for those
who value discretion as much as
culinary innovation.''',
      ),
    ];

    try {
      for (var res in resturants) {
        final doc = _firestore.collection('resutants').doc();

        await doc.set({...res.toJson(), 'id': doc.id});
      }
    } catch (e) {
      print("firebase: $e");
    }
  }

  Future<List<ResturantModel>> getResturants() async {
    try {
      final snapshot = await _firestore.collection('resutants').get();

      print("Documents Count: ${snapshot.docs.length}");

      for (var doc in snapshot.docs) {
        print(doc.data());
      }

      return snapshot.docs
          .map((doc) => ResturantModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      print("firebase: $e");
      return [];
    }
  }

  Future<void> bookRestaurant({
    required ResturantModel restaurant,
    required DateTime date,
    required TimeOfDay time,
    required int guests,
    required BuildContext context,
  }) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await _firestore.collection("users").doc(uid).collection("bookings").add({
      "restaurantId": restaurant.id,
      "restaurantName": restaurant.name,
      "image": restaurant.image,
      "description": restaurant.description,
      "date": DateFormat("dd/MM/yyyy").format(date),
      "time": time.format(context),
      "guestCount": guests,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }
}
