import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:migoc2/resources/colors+extensions.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      primaryColor: UIColors.primaryColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: UIColors.secondaryColor,
        unselectedItemColor: UIColors.unselectedColor,
        backgroundColor: UIColors.primaryColor
      ),
      backgroundColor: isDarkTheme ? UIColors.darkBackgroundColor : UIColors.lightBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: UIColors.primaryColor
      ),
        scaffoldBackgroundColor: isDarkTheme ? UIColors.darkBackgroundColor : UIColors.lightBackgroundColor
    );
  }
}