import 'package:aura_luxury_reservations/features/auth/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}
