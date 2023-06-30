import 'package:flutter/foundation.dart';
import 'package:streamlivr/src/services/user_service.dart';

import '../models/register_user_model.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _model;
  UserModel? get model => _model;
  bool _hadData = false;
  bool get hadData => _hadData;
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
}
