import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/single_file_uploader.dart';
import '../models/post_model.dart';
import '../models/register_user_model.dart';
import '../models/response_model.dart';

class UserService {
  static Future<ResponseModel> createUser({
    required RegisterUserModel userData,
  }) async {
    final firestoreInstance = FirebaseFirestore.instance;
    final userRef = firestoreInstance.collection('users');
    var userId = FirebaseAuth.instance.currentUser!.uid;
    final id = userRef.doc(userId);

    try {
      ResponseModel? model;
      if (userData.avatar == "") {
        print("no image");
        await id.set({
          'uuid': id.id,
          'firstName': userData.firstName,
          'lastName': userData.lastName,
          'dateOfBirth': userData.dateOfBirth,
          'emailAddress': userData.emailAddress,
          'password': userData.password,
          'phoneNumber': userData.phoneNumber,
          'avatar': "",
        }).then((value) {
          model = ResponseModel(data: 'success', status: 'success');
        }).onError((error, stackTrace) {
          model = ResponseModel(data: error, status: 'error');
        });
      } else {
        await SingleFileUploader.uploadFile(File(userData.avatar.toString()))
            .then((value) async {
          if (value.status == 'success') {
            await id.set({
              'uuid': id.id,
              'firstName': userData.firstName,
              'lastName': userData.lastName,
              'dateOfBirth': userData.dateOfBirth,
              'emailAddress': userData.emailAddress,
              'password': userData.password,
              'phoneNumber': userData.phoneNumber,
              'avatar': value.data,
            }).then((value) {
              model = ResponseModel(data: 'success', status: 'success');
            }).onError((error, stackTrace) {
              model = ResponseModel(data: error, status: 'error');
            });
          } else {
            model = ResponseModel(data: 'error', status: 'error');
          }
        });
      }
      return model!;
    } catch (e) {
      log(e.toString());
      return ResponseModel(data: e, status: 'error');
    }
  }

  static Future<ResponseModel> chooseGenre({
    required List<dynamic> genre,
  }) async {
    final firestoreInstance = FirebaseFirestore.instance;
    final userRef = firestoreInstance.collection('users');
    var userId = FirebaseAuth.instance.currentUser!.uid;
    final id = userRef.doc(userId);
    ResponseModel? model;
    try {
      await id.update({
        'genres': ["hello", "hi"],
      }).then((value) {
        model = ResponseModel(data: 'success', status: 'success');
      }).onError((error, stackTrace) {
        model = ResponseModel(data: error, status: 'error');
      });
      return model!;
    } catch (e) {
      log(e.toString());
      model = ResponseModel(data: e, status: 'error');
    }
    return model!;
  }

  static Future<RegisterUserModel?> fetchUser() async {
    final firestoreInstance = FirebaseFirestore.instance;
    var pref = await SharedPreferences.getInstance();
    var userId = pref.getString('uuid') ?? "";

    try {
      final doc = await firestoreInstance.collection('users').doc(userId).get();

      if (doc.exists) {
        final userData = RegisterUserModel.fromMap(doc.data()!);
        return userData;
      } else {
        return null;
      }
    } catch (e) {
      debugPrintStack();
      return null;
    }
  }

  static Future<RegisterUserModel?> fetchPost() async {
    final firestoreInstance = FirebaseFirestore.instance;
    var pref = await SharedPreferences.getInstance();
    var userId = pref.getString('uuid') ?? "";

    try {
      final doc = await firestoreInstance.collection('post').doc(userId).get();

      if (doc.exists) {
        final userData = RegisterUserModel.fromMap(doc.data()!);
        return userData;
      } else {
        return null;
      }
    } catch (e) {
      debugPrintStack();
      return null;
    }
  }

  static Stream<List<PostModel>> readPosts() {
    return FirebaseFirestore.instance.collection('post').snapshots().map(
        (event) => event.docs.map((e) => PostModel.fromMap(e.data())).toList());
  }

  static Future<ResponseModel> uploadPost(PostModel userData) async {
    final firestoreInstance = FirebaseFirestore.instance;
    final userRef = firestoreInstance.collection('post');
    var userId = FirebaseAuth.instance.currentUser!.uid;
    final id = userRef.doc();
    log(userData.toString());
    try {
      ResponseModel? model;
      if (userData.avatar == null) {
        await id.set({
          'userId': userId,
          'postId': id.id,
          'title': userData.title,
          'description': userData.description,
          'tag': userData.tags,
          'avatar': "",
        }).then((value) {
          model = ResponseModel(data: 'success', status: 'success');
        }).onError((error, stackTrace) {
          model = ResponseModel(data: error, status: 'error');
        });
      } else {
        await SingleFileUploader.uploadFile(File(userData.avatar.toString()))
            .then((value) async {
          if (value.status == "success") {
            await id.set({
              'userId': userId,
              'postId': id.id,
              'title': userData.title,
              'description': userData.description,
              'tag': userData.tags,
              'avatar': value.data.toString(),
            }).then((value) {
              model = ResponseModel(data: 'success', status: 'success');
            }).onError((error, stackTrace) {
              model = ResponseModel(data: error, status: 'error');
            });
          } else {
            return ResponseModel(data: 'error', status: 'error');
          }
        });
      }
      return model!;
    } catch (e) {
      return ResponseModel(data: e, status: 'error');
    }
  }
}
