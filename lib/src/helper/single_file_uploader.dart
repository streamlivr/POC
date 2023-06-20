import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import '../models/response_model.dart';



class SingleFileUploader {
  static Future<ResponseModel> uploadFile(File? file) async {
    try {
      if (file == null) {
        return ResponseModel(data: '', status: 'error');
      } else {
        final storage = FirebaseStorage.instance;
        final storageRef = storage.ref();
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        final fileName = '$timestamp.jpg';
        final uploadTask = storageRef.child(fileName).putFile(file);
        final storageTaskSnapshot = await uploadTask;
        final downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
        return ResponseModel(data: downloadUrl, status: 'success');
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(data: e, status: 'error');
    }
  }
}
