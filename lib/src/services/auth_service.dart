import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message.toString());
    }
  }

  static Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message.toString());
    }
  }
}
