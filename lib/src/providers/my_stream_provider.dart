import 'package:flutter/foundation.dart';
import 'package:streamlivr/src/services/user_service.dart';

import '../models/stream_model.dart';

class MyStreamProvider extends ChangeNotifier {
  List<StreamModel>? _model;
  List<StreamModel>? get model => _model;
  bool _hadData = false;
  bool get hadData => _hadData;
  fetchData() async {
    var data = await UserService.readStreams();

    if (data!.isEmpty == "success") {
      _hadData = true;
      // _model = StreamModel.fromMap(data.data);
      print(_model);
      notifyListeners();
    } else {
      _model = null;
      _hadData = false;
      notifyListeners();
    }
  }
}
