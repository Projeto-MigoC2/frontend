import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreferences {
  static const themeKey = "theme_key";

  Future<void> setTheme({required bool value}) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(themeKey, value);
  }

  Future<bool> getTheme() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(themeKey) ?? false;
  }
}
