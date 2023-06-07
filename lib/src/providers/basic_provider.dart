import 'package:flutter/foundation.dart';

class BasicProvider extends ChangeNotifier {
  bool _check = false;
  bool get check => _check;

  int _networkIndex = -1;
  int get networkIndex => _networkIndex;

int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  int _walletIndex = -1;
  int get walletIndex => _walletIndex;

  checkBox(bool value) {
    _check = !_check;
    notifyListeners();
  }

  changeNetworkIndex(int value) {
    _networkIndex = value;
    notifyListeners();
  }

  
  changeIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  changeWalletIndex(int value) {
    _walletIndex = value;
    notifyListeners();
  }
}
