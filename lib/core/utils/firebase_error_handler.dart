import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler {
  static String getMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-credential':
        return 'Invalid email or password.';

      case 'user-not-found':
        return 'No account found with this email.';

      case 'wrong-password':
        return 'Incorrect password.';

      case 'email-already-in-use':
        return 'This email is already in use.';

      case 'weak-password':
        return 'Password must be at least 6 characters long.';

      case 'invalid-email':
        return 'Please enter a valid email address.';

      case 'network-request-failed':
        return 'Please check your internet connection.';

      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';

      case 'user-disabled':
        return 'This account has been disabled.';

      default:
        return 'Something went wrong. Please try again.';
    }
  }
}