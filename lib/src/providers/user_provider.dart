import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:streamlivr/src/services/user_service.dart';

import '../models/user_model.dart';
import '../models/wallet_detail_model.dart';

class UserProvider extends ChangeNotifier {
  WalletDetailModel? _model1;
  UserModel? _model;
  UserModel? get model => _model;
  WalletDetailModel? get model1 => _model1;
  bool _hadData = false;
  bool _hadData1 = false;
  bool get hadData => _hadData;
  bool get hadData1 => _hadData1;
  bool? _hasChannel = false;
  bool? get hasChannel => _hasChannel;

  checkChannel() {
    FirebaseFirestore.instance
        .collection('channels')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      if (value.exists) {
        _hasChannel = true;
        notifyListeners();
      } else {
        _hasChannel = false;
        notifyListeners();
      }
    });
  }

  fetchData() async {
    var data = await UserService.fetchUser();

    if (data!.status == "success") {
      _hadData = true;
      _model = UserModel.fromMap(data.data);
      print(_model);
      notifyListeners();
    } else {
      _model = null;
      _hadData = false;
      notifyListeners();
    }
  }

  Future fetchWalletData() async {
    var data = await UserService.fetchUserWallet();

    if (data!.status == "success") {
      _hadData1 = true;
      _model1 = WalletDetailModel.fromMap(data.data);
      notifyListeners();
    } else {
      _model = null;
      _hadData1 = false;
      notifyListeners();
    }
  }
}
