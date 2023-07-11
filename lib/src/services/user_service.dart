import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_date/random_date.dart';
import 'package:streamlivr/src/models/genre_model.dart';
import 'package:streamlivr/src/models/user_model.dart';
import 'package:streamlivr/src/models/wallet_detail_model.dart';
import 'package:unique_name_generator/unique_name_generator.dart';

import '../helper/generate_stream_id.dart';
import '../helper/single_file_uploader.dart';
import '../models/channel_model.dart';
import '../models/register_user_model.dart';
import '../models/response_model.dart';
import '../models/stream_model.dart';

class UserService {
  static Future<ResponseModel> createWallet() async {
    try {
      var response = await http
          .get(Uri.parse('https://empty-brook-2068.fly.dev/api/v1/wallet'));
      log(response.body.toString());
      if (response.statusCode.toString()[0] == "2") {
        return ResponseModel(data: response.body, status: 'success');
      } else {
        return ResponseModel(data: response.body, status: 'error');
      }
    } catch (e) {
      print(e);
      return ResponseModel(data: e, status: 'error');
    }
  }

  static Future<ResponseModel> createUser({
    required RegisterUserModel userData,
  }) async {
    var wallet = await createWallet();

    WalletDetailModel.fromJson(jsonDecode(wallet.data)[0]);

    final firestoreInstance = FirebaseFirestore.instance;
    final userRef = firestoreInstance.collection('users');
    var userId = FirebaseAuth.instance.currentUser!.uid;
    final id = userRef.doc(userId);
    var ung = UniqueNameGenerator(
      dictionaries: [adjectives, animals],
      style: NameStyle.capital,
      separator: '_',
    );
    var randomDate = RandomDate.withStartYear(2000);

    try {
      ResponseModel? model;

      if (userData.avatar == "") {
        print("no image");
        await id.set({
          'uuid': id.id,
          'firstName': ung.generate().split("_")[0],
          'lastName': ung.generate().split("_")[1],
          'dateOfBirth': '${randomDate.random().microsecondsSinceEpoch}',
          'emailAddress': userData.emailAddress,
          'password': userData.password,
          'userType': userData.userType,
          'phoneNumber': generateRandomnumber(),
          'avatar': "https://img.icons8.com/3d-fluency/94/person-male--v3.png",
        }).then((value) async {
          await id.collection('wallet').doc('wallet').set(
              WalletDetailModel.fromJson(jsonDecode(wallet.data)[0]).toMap());
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
              'userType': userData.userType,
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

  static Future<ResponseModel> updateUser({
    required RegisterUserModel userData,
  }) async {
    final firestoreInstance = FirebaseFirestore.instance;
    final userRef = firestoreInstance.collection('users');
    var userId = FirebaseAuth.instance.currentUser!.uid;
    final id = userRef.doc(userId);

    try {
      ResponseModel? model;

      if (userData.avatar == "") {
        await id.update({
          'uuid': id.id,
          'firstName': userData.firstName,
          'lastName': userData.lastName,
          'dateOfBirth': userData.dateOfBirth,
          'phoneNumber': generateRandomnumber(),
          'avatar': userData.avatar,
        }).then((value) async {
          model = ResponseModel(data: 'success', status: 'success');
        }).onError((error, stackTrace) {
          model = ResponseModel(data: error, status: 'error');
        });
      } else {
        await SingleFileUploader.uploadFile(File(userData.avatar.toString()))
            .then((value) async {
          if (value.status == 'success') {
            await id.update({
              'uuid': id.id,
              'firstName': userData.firstName,
              'lastName': userData.lastName,
              'dateOfBirth': userData.dateOfBirth,
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

  static Future<ResponseModel> updateStreamInfo({
    required RegisterUserModel userData,
  }) async {
    final firestoreInstance = FirebaseFirestore.instance;
    final userRef = firestoreInstance.collection('users');
    var userId = FirebaseAuth.instance.currentUser!.uid;
    final id = userRef.doc(userId);

    try {
      ResponseModel? model;

      if (userData.avatar == "") {
        await id.update({
          'uuid': id.id,
          'firstName': userData.firstName,
          'lastName': userData.lastName,
          'dateOfBirth': userData.dateOfBirth,
          'phoneNumber': generateRandomnumber(),
          'avatar': userData.avatar,
        }).then((value) async {
          model = ResponseModel(data: 'success', status: 'success');
        }).onError((error, stackTrace) {
          model = ResponseModel(data: error, status: 'error');
        });
      } else {
        await SingleFileUploader.uploadFile(File(userData.avatar.toString()))
            .then((value) async {
          if (value.status == 'success') {
            await id.update({
              'uuid': id.id,
              'firstName': userData.firstName,
              'lastName': userData.lastName,
              'dateOfBirth': userData.dateOfBirth,
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

  static Future<ResponseModel> createChannel({
    required ChannelModel userData,
  }) async {
    final firestoreInstance = FirebaseFirestore.instance;
    final userRef = firestoreInstance.collection('channels');
    var userId = FirebaseAuth.instance.currentUser!.uid;
    final id = userRef.doc(userId);

    try {
      ResponseModel? model;
      await SingleFileUploader.uploadFile(File(userData.image.toString()))
          .then((value) async {
        if (value.status == 'success') {
          await id.update({
            'channelId': id.id,
            'title': userData.title,
            'userId': userId,
            'tag': userData.tag,
            'followers': "0",
            'image': value.data,
          }).then((value) {
            model = ResponseModel(data: 'success', status: 'success');
          }).onError((error, stackTrace) {
            model = ResponseModel(data: error, status: 'error');
          });
        } else {
          model = ResponseModel(data: 'error', status: 'error');
        }
      });

      return model!;
    } catch (e) {
      log(e.toString());
      return ResponseModel(data: e, status: 'error');
    }
  }

  static Stream<List<ChannelModel>> readChannel() {
    return FirebaseFirestore.instance.collection('channels').snapshots().map(
        (event) =>
            event.docs.map((e) => ChannelModel.fromMap(e.data())).toList());
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
        'genres': genre,
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

  static Future<ResponseModel> chooseChannel({
    required List<dynamic> channel,
  }) async {
    final firestoreInstance = FirebaseFirestore.instance;
    final userRef = firestoreInstance.collection('users');
    var userId = FirebaseAuth.instance.currentUser!.uid;
    final id = userRef.doc(userId);
    ResponseModel? model;
    try {
      await id.update({
        'channel': channel,
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

  static Future<ResponseModel?> fetchUser() async {
    final firestoreInstance = FirebaseFirestore.instance;

    var userId = FirebaseAuth.instance.currentUser!.uid;

    try {
      final doc = await firestoreInstance.collection('users').doc(userId).get();

      if (doc.exists) {
        final userData = doc.data();
        return ResponseModel(data: userData, status: "success");
      } else {
        return ResponseModel(data: '', status: "error");
      }
    } catch (e) {
      return ResponseModel(data: e, status: "error");
    }
  }

    static Future<ResponseModel?> fetchUserWallet() async {
    final firestoreInstance = FirebaseFirestore.instance;

    var userId = FirebaseAuth.instance.currentUser!.uid;

    try {
      final doc = await firestoreInstance.collection('users').doc(userId).collection('wallet').doc('wallet').get();

      if (doc.exists) {
        final userData = doc.data();
        return ResponseModel(data: userData, status: "success");
      } else {
        return ResponseModel(data: '', status: "error");
      }
    } catch (e) {
      return ResponseModel(data: e, status: "error");
    }
  }

  static Future<StreamModel?> fetchStream({required String streamId}) async {
    final firestoreInstance = FirebaseFirestore.instance;
    try {
      final doc =
          await firestoreInstance.collection('stream').doc(streamId).get();

      if (doc.exists) {
        final userData = StreamModel.fromMap(doc.data()!);
        return userData;
      } else {
        return null;
      }
    } catch (e) {
      debugPrintStack();
      return null;
    }
  }

  static Stream<List<StreamModel>> readStreams() {
    return FirebaseFirestore.instance.collection('stream').snapshots().map(
        (event) =>
            event.docs.map((e) => StreamModel.fromMap(e.data())).toList());
  }

  static Stream<List<GenreModel>> readGenre() {
    return FirebaseFirestore.instance.collection('genre').snapshots().map(
        (event) =>
            event.docs.map((e) => GenreModel.fromMap(e.data())).toList());
  }

  static Stream<List<UserModel>> readUser() {
    return FirebaseFirestore.instance.collection('users').snapshots().map(
        (event) => event.docs.map((e) => UserModel.fromMap(e.data())).toList());
  }

  static Future<ResponseModel> uploadPost(StreamModel userData) async {
    final firestoreInstance = FirebaseFirestore.instance;
    final userRef = firestoreInstance.collection('stream');
    final id = userRef.doc();
    log(userData.toString());
    try {
      ResponseModel? model;
      // if (userData.avatar == "") {
      await id.set({
        'userId': userData.userId,
        'streamId': id.id,
        'title': userData.title,
        'description': userData.description,
        'avatar': userData.avatar,
        'userName': userData.userName,
        'streamImage': userData.streamImage,
      }).then((value) {
        model = ResponseModel(data: 'success', status: 'success');
      }).onError((error, stackTrace) {
        model = ResponseModel(data: error, status: 'error');
      });

      return model!;
    } catch (e) {
      return ResponseModel(data: e, status: 'error');
    }
  }
}
