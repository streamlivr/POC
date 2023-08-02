import 'package:flutter/material.dart';

class AdsProvider with ChangeNotifier {
  bool _shouldAdsRating = false;

  bool get shouldShowAds => _shouldAdsRating;

  void setShowAds(bool value) {
    _shouldAdsRating = value;
    notifyListeners();
  }
}
