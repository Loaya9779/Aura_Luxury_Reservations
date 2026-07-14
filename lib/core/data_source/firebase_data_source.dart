import 'package:aura_luxury_reservations/features/auth/model/user_model.dart';
import 'package:aura_luxury_reservations/features/details_resturant/model/booking_model.dart';
import 'package:aura_luxury_reservations/features/view_resturant/model/resturant_model.dart';
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
        image: "https://cdn.corenexis.com/f/bHQag6zIKUt.png",
        description:
            '''Mizu Zen offers a refined Japanese dining experience where traditional flavors meet
modern presentation. Enjoy premium sushi, fresh sashimi, and signature dishes crafted
with the finest ingredients in a peaceful,
elegant atmosphere.''',
        location: '',
        rating: '',
      ),
      ResturantModel(
        id: "",
        name: "L'Eclat d'Or",
        image: "https://cdn.corenexis.com/f/l1lD1ip39ER.png",
        description: '''L'Eclat d'Or delivers an exceptional fine
dining experience inspired by classic
French cuisine. Every plate is prepared
with seasonal ingredients, artistic
presentation, and impeccable service
to create unforgettable moments.''',
        location: '',
        rating: '',
      ),
      ResturantModel(
        id: "",
        name: "L'Oiseau Bleu Interior",
        image: "https://cdn.corenexis.com/f/1hIVojZysZo.png",
        description: '''L'Oiseau Bleu redefines contemporary
French gastronomy under the vision of
Chef Marcelle Vasseur. Every dish is a
silent symphony of seasonal ingredients
sourced from exclusive coastal estates.
The atmosphere is curated for those
who value discretion as much as
culinary innovation.''',
        location: '',
        rating: '',
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

      return snapshot.docs.map((doc) => ResturantModel.fromJson(doc)).toList();
    } catch (e) {
      print("firebase: $e");
      return [];
    }
  }

  // Future<void> bookRestaurant({
  //   required ResturantModel restaurant,
  //   required DateTime date,
  //   required TimeOfDay time,
  //   required int guests,
  //   required BuildContext context,
  // }) async {
  //   final uid = FirebaseAuth.instance.currentUser!.uid;

  //   await _firestore.collection("users").doc(uid).collection("bookings").add({
  //     "restaurantId": restaurant.id,
  //     "restaurantName": restaurant.name,
  //     "image": restaurant.image,
  //     "description": restaurant.description,
  //     "date": DateFormat("dd/MM/yyyy").format(date),
  //     "time": time.format(context),
  //     "guestCount": guests,
  //     "createdAt": FieldValue.serverTimestamp(),
  //   });
  // }

  Future<void> bookRestaurant({
    required BookingModel booking,
    required BuildContext context,
  }) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    await _firestore.collection("users").doc(uid).set({
      "bookings": FieldValue.arrayUnion([
        {
          "restaurantId": booking.restaurant.id,
          "restaurantName": booking.restaurant.name,
          "image": booking.restaurant.image,
          "description": booking.restaurant.description,
          "date": DateFormat("dd/MM/yyyy").format(booking.date),
          "time": booking.time.format(context),
          "guestCount": booking.guestCount,
          "createdAt": Timestamp.now(),
        },
      ]),
    }, SetOptions(merge: true));
  }
}
