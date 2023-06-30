import 'package:flutter/foundation.dart';
import 'package:streamlivr/src/models/channel_model.dart';

import '../../assets/assets.dart';

class ChannelProvider extends ChangeNotifier {
  final List<ChannelModel> _list = [
    ChannelModel(title: "Genre 1", image: Assets.assetsImagesGenre1),
    ChannelModel(title: "Genre 2", image: Assets.assetsImagesGenre2),
    ChannelModel(title: "Genre 3", image: Assets.assetsImagesGenre3),
    ChannelModel(title: "Genre 4", image: Assets.assetsImagesGenre4),
    ChannelModel(title: "Genre 5", image: Assets.assetsImagesGenre1),
    ChannelModel(title: "Genre 6", image: Assets.assetsImagesGenre2),
    ChannelModel(title: "Genre 7", image: Assets.assetsImagesGenre3),
    ChannelModel(title: "Genre 8", image: Assets.assetsImagesGenre4),
    ChannelModel(title: "Genre 9", image: Assets.assetsImagesGenre1),
    ChannelModel(title: "Genre 10", image: Assets.assetsImagesGenre2),
    ChannelModel(title: "Genre 11", image: Assets.assetsImagesGenre3),
    ChannelModel(title: "Genre 12", image: Assets.assetsImagesGenre4),
    ChannelModel(title: "Genre 13", image: Assets.assetsImagesGenre1),
    ChannelModel(title: "Genre 14", image: Assets.assetsImagesGenre2),
    ChannelModel(title: "Genre 15", image: Assets.assetsImagesGenre3),
    ChannelModel(title: "Genre 16", image: Assets.assetsImagesGenre4),
  ];

  List<ChannelModel> get list => _list;

  final List<ChannelModel> _filterList = [];
  List<ChannelModel> get filterListdList => _filterList;

  final List<dynamic> _checkedList = [];
  List<dynamic> get checkedList => _checkedList;

  checkList(ChannelModel data) {
    if (_checkedList.contains(data.title)) {
      _checkedList.remove(data.title);
      notifyListeners();
    } else {
      _checkedList.add(data.title);
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
