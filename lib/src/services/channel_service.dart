import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:streamlivr/src/models/all_channel_model.dart';

import '../helper/single_file_uploader.dart';

class ChannelService {
  static var userId = FirebaseAuth.instance.currentUser!.uid;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  static final CollectionReference channelCollection =
      FirebaseFirestore.instance.collection('channels');
  static Future<void> createChannel({
    required AllChannelModel channelData,
  }) async {
    final docId = channelCollection.doc(userId);
    try {
      var imageUpload = await SingleFileUploader.uploadFile(
          File(channelData.channelImage.toString()));

      channelData.channelId = docId.id;
      channelData.channelImage = imageUpload.data.toString();
      channelData.channelFollowers = "0";
      channelData.channelFollowing = "0";
      channelData.totalViews = "0";
      channelData.totalLikes = "0";
      channelData.totalDislikes = "0";
      channelData.channelOwner = userId.toString();
      channelData.totalDownloads = "0";
      channelData.channelCreatedDate = DateTime.now().toUtc().toString();
      channelData.channelUpdatedDate = DateTime.now().toUtc().toString();
      channelData.channelType = "";
      channelData.channelStatus = "";
      await docId.set(channelData.toMap());
    } on FirebaseException catch (e) {
      log(e.toString());
      throw Future.error(e.message.toString());
    }
  }

  static Future editChannel({
    required AllChannelModel channelData,
    File? imageFile,
  }) async {
    final docId = channelCollection.doc(userId);
    try {
      if (imageFile != null) {
        await SingleFileUploader.uploadFile(
                File(channelData.channelImage.toString()))
            .then((value) async {
          channelData.channelImage = value.toString();
          await docId.update(channelData.toMap());
        });
      } else {
        await docId.update(channelData.toMap());
      }
    } on FirebaseException catch (e) {
      log(e.toString());
      Future.error(e.message.toString());
    }
  }

  static Stream<List<AllChannelModel>> readChannels() {
    return FirebaseFirestore.instance.collection('channels').snapshots().map(
        (event) =>
            event.docs.map((e) => AllChannelModel.fromMap(e.data())).toList());
  }

  static Stream<List<AllChannelModel>> readFollowingChannels() {
    return FirebaseFirestore.instance
        .collection('channels')
        .where('followers', arrayContainsAny: [
          userId.toString(),
        ])
        .snapshots()
        .map((event) =>
            event.docs.map((e) => AllChannelModel.fromMap(e.data())).toList());
  }

  static Future<AllChannelModel?> readChannel(
      {required String channelId}) async {
    final collectionRef = FirebaseFirestore.instance.collection('channels');
    final docId = collectionRef.doc(channelId);
    try {
      final doc = await docId.get();
      return AllChannelModel.fromMap(doc.data()!);
    } on FirebaseException catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserFollowingStream(
      {String? user}) {
    if (_auth.currentUser != null) {
      String userId = _auth.currentUser!.uid;
      return _firestore.collection('users').doc(user ?? userId).snapshots();
    }
    return const Stream.empty();
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserFollowerStream(
      {String? user}) {
    if (_auth.currentUser != null) {
      String userId = _auth.currentUser!.uid;
      try {
        return _firestore
            .collection('channels')
            .doc(user ?? userId)
            .snapshots();
      } catch (e) {
        log(e.toString());
        return const Stream.empty();
      }
    }
    return const Stream.empty();
  }

  static Future<void> followChannel({
    required String targetChannelId,
  }) async {
    String currentUserId = userId;
    await usersCollection.doc(currentUserId).update({
      'channel': FieldValue.arrayUnion([targetChannelId]),
    });
    await channelCollection.doc(targetChannelId).update({
      'followers': FieldValue.arrayUnion([currentUserId]),
    });
  }

  static Future<void> unfollowChannel({
    required String targetChannelId,
  }) async {
    String currentUserId = userId;
    await usersCollection.doc(currentUserId).update({
      'channel': FieldValue.arrayRemove([targetChannelId]),
    });
    await channelCollection.doc(targetChannelId).update({
      'followers': FieldValue.arrayRemove([currentUserId]),
    });
  }

  // static Stream<int> followersCount({required String user}) {
  //   int count = 0;
  //   String channelId = _auth.currentUser!.uid;
  //   _firestore
  //       .collection('channels')
  //       .doc(channelId)
  //       .snapshots()
  //       .asyncMap((event) {
  //     if (event.exists) {
  //     } else {}
  //   });
  //   return count;
  // }
}
