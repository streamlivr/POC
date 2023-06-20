import 'package:flutter/foundation.dart';
import 'package:streamlivr/src/models/genre_model.dart';

import '../../assets/assets.dart';

class GenreProvider extends ChangeNotifier {
  final List<GenreModel> _list = [
    GenreModel(title: "Genre 1", image: Assets.assetsImagesGenre1),
    GenreModel(title: "Genre 2", image: Assets.assetsImagesGenre2),
    GenreModel(title: "Genre 3", image: Assets.assetsImagesGenre3),
    GenreModel(title: "Genre 4", image: Assets.assetsImagesGenre4),
    GenreModel(title: "Genre 5", image: Assets.assetsImagesGenre1),
    GenreModel(title: "Genre 6", image: Assets.assetsImagesGenre2),
    GenreModel(title: "Genre 7", image: Assets.assetsImagesGenre3),
    GenreModel(title: "Genre 8", image: Assets.assetsImagesGenre4),
    GenreModel(title: "Genre 9", image: Assets.assetsImagesGenre1),
    GenreModel(title: "Genre 10", image: Assets.assetsImagesGenre2),
    GenreModel(title: "Genre 11", image: Assets.assetsImagesGenre3),
    GenreModel(title: "Genre 12", image: Assets.assetsImagesGenre4),
    GenreModel(title: "Genre 13", image: Assets.assetsImagesGenre1),
    GenreModel(title: "Genre 14", image: Assets.assetsImagesGenre2),
    GenreModel(title: "Genre 15", image: Assets.assetsImagesGenre3),
    GenreModel(title: "Genre 16", image: Assets.assetsImagesGenre4),
  ];

  List<GenreModel> get list => _list;
  final List<GenreModel> _checkedList = [];
  final List<GenreModel> _filterList = [];
  List<GenreModel> get filterListdList => _filterList;
  List<GenreModel> get checkedList => _checkedList;

  checkList(GenreModel data) {
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
