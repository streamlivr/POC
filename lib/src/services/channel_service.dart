import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:streamlivr/src/models/all_channel_model.dart';

import '../helper/single_file_uploader.dart';

class ChannelService {
  static final firestoreInstance = FirebaseFirestore.instance;
  static var userId = FirebaseAuth.instance.currentUser!.uid;
  static Future<void> createChannel({
    required AllChannelModel channelData,
  }) async {
    final collectionRef = firestoreInstance.collection('channels');
    final docId = collectionRef.doc(userId);
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
    final collectionRef = firestoreInstance.collection('channels');
    final docId = collectionRef.doc(userId);
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

  static Stream<List<AllChannelModel>> readChannel() {
    return FirebaseFirestore.instance.collection('channels').snapshots().map(
        (event) =>
            event.docs.map((e) => AllChannelModel.fromMap(e.data())).toList());
  }
}
