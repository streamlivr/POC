import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  changeMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
