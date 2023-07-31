// user_presence_provider.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPresenceProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserPresence(bool isOnline) async {
    if (_auth.currentUser != null) {
      String userId = _auth.currentUser!.uid;
      DocumentReference userRef = _firestore.collection('users').doc(userId);

      await userRef.update({
        'isOnline': isOnline,
        'lastOnline': isOnline ? null : DateTime.now().toUtc().toString(),
      });
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserPresenceStream() {
    if (_auth.currentUser != null) {
      String userId = _auth.currentUser!.uid;
      return _firestore.collection('users').doc(userId).snapshots();
    }
    return const Stream.empty();
  }
}
