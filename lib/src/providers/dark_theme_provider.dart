import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:streamlivr/src/providers/poc_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  PocPreferences pocPreferences = PocPreferences();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  changeDarkTheme(bool value) {
    _darkTheme = value;
    print(_darkTheme);
    log(value.toString());
    pocPreferences.setDarkTheme(value);
    notifyListeners();
  }
}
