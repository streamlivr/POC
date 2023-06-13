import 'package:flutter/foundation.dart';
import 'package:streamlivr/src/providers/poc_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  PocPreferences pocPreferences = PocPreferences();
  bool _darkTheme = false;

  DarkThemeProvider() {
    getTheme();
  }

  bool get darkTheme => _darkTheme;
  getTheme() async {
    _darkTheme = await pocPreferences.getTheme();
    notifyListeners();
  }

  set darkTheme(bool value) {
    _darkTheme = value;
    pocPreferences.setDarkTheme(value);
    notifyListeners();
  }
}
