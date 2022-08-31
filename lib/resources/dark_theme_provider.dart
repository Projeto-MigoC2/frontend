import 'package:flutter/foundation.dart';
import 'package:migoc2/resources/dark_theme_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreferences.setTheme(value);
  }
}