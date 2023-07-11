import 'package:flutter/foundation.dart';
import 'package:streamlivr/src/models/user_model.dart';
import 'package:streamlivr/src/services/user_service.dart';

class ChannelProvider extends ChangeNotifier {
  List<UserModel> _list = [];

  List<UserModel> get list => _list;

  final List<UserModel> _filterList = [];
  List<UserModel> get filterListdList => _filterList;

  final List<dynamic> _checkedList = [];
  List<dynamic> get checkedList => _checkedList;

  fetcChannel() async {
    _list = await UserService.readUser().first;
    notifyListeners();
  }

  checkList(String data) {
    if (_checkedList.contains(data)) {
      _checkedList.remove(data);
      notifyListeners();
    } else {
      _checkedList.add(data);
      notifyListeners();
    }
  }

  filterList(String data) {
    for (var i = 0; i < _list.length; i++) {
      if (_list[i].firstName!.contains(data)) {
        _list.remove(_list[i]);
        notifyListeners();
      } else {
        _list.add(_list[i]);
        notifyListeners();
      }
    }
  }
}
