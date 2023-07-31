import 'package:flutter/foundation.dart' as foundation;
import 'package:streamlivr/src/models/genre_model.dart';
import 'package:streamlivr/src/services/user_service.dart';

class GenreProvider extends foundation.ChangeNotifier {
  List<GenreModel> _list = [];

  List<GenreModel> get list => _list;

  final List<GenreModel> _filterList = [];
  List<GenreModel> get filterListdList => _filterList;

  final List<dynamic> _checkedList = [];
  List<dynamic> get checkedList => _checkedList;

  checkList(String data) {
    if (_checkedList.contains(data)) {
      _checkedList.remove(data);
      notifyListeners();
    } else {
      _checkedList.add(data);
      notifyListeners();
    }
  }

  fetchList() async {
    _list = await UserService.readGenre().first;
    notifyListeners();
  }

  filterList(String data) {
    for (var i = 0; i < _list.length; i++) {
      if (_list[i].title!.contains(data)) {
        _list.remove(_list[i]);
        notifyListeners();
      } else {
        _list.add(_list[i]);
        notifyListeners();
      }
    }
  }
}
