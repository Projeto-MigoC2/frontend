import 'package:flutter/material.dart';
import 'package:migoc2/resources/colors_extensions.dart';

ThemeData themeData(
    {required bool isDarkTheme, required BuildContext context}) {
  return ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(
        color: Color(0xffA1A1A1),
      ),
      prefixIconColor: Color(0xffA1A1A1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none,
      ),
    ),
    brightness: isDarkTheme ? Brightness.dark : Brightness.light,
    primaryColor: UIColors.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: UIColors.secondaryColor,
      unselectedItemColor: UIColors.unselectedColor,
      backgroundColor: UIColors.primaryColor,
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
      ),
      selectedLabelStyle: TextStyle(
        fontSize: 16,
      ),
    ),
    backgroundColor: isDarkTheme
        ? UIColors.darkBackgroundColor
        : UIColors.lightBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: UIColors.primaryColor,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontFamily: 'Source Sans Pro',
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      ),
    ),
    scaffoldBackgroundColor: isDarkTheme
        ? UIColors.darkBackgroundColor
        : UIColors.lightBackgroundColor,
  );
}
