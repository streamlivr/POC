import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../models/response_model.dart';

class AuthService {
  static Future<ResponseModel> loginUser({
    required String email,
    required String password,
  }) async {
    final auth = FirebaseAuth.instance;
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      log(user.toString());
      return ResponseModel(data: user!.uid, status: "success");
    } catch (e) {
      return ResponseModel(data: e, status: 'error');
    }
  }

  static Future<ResponseModel> registerUser({
    required String email,
    required String password,
  }) async {
    final auth = FirebaseAuth.instance;
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      log(user.toString());
      return ResponseModel(data: user, status: "success");
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'email-already-in-use') {
        return ResponseModel(data: 'email already in use', status: "error");
      } else if (e.code == 'invalid-email') {
        return ResponseModel(data: 'invalid email', status: "error");
      } else if (e.code == 'weak-password') {
        return ResponseModel(data: 'weak password', status: "error");
      } else {
        return ResponseModel(data: 'Something went wrong', status: "error");
      }
    }
  }
}
