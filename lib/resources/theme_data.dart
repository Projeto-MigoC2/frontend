import 'package:flutter/material.dart';
import 'package:migoc2/resources/colors_extensions.dart';

ThemeData themeData({
  required bool isDarkTheme,
  required BuildContext context,
}) {
  return ThemeData(
    primaryTextTheme: TextTheme(
      bodyText1: TextStyle(
        fontFamily: 'Source Sans Pro',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: isDarkTheme ? UIColors.darkFontColor : UIColors.lightFontColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: isDarkTheme ? UIColors.darkBoxColor : UIColors.lightBoxColor,
      hintStyle: const TextStyle(
        color: Color(0xffA1A1A1),
      ),
      prefixIconColor: const Color(0xffA1A1A1),
      border: const OutlineInputBorder(
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
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
      ),
      selectedLabelStyle: const TextStyle(
        fontSize: 16,
      ),
    ),
    backgroundColor: isDarkTheme
        ? UIColors.darkBackgroundColor
        : UIColors.lightBackgroundColor,
    focusColor: isDarkTheme ? UIColors.darkFontColor : UIColors.lightFontColor,
    appBarTheme: AppBarTheme(
      backgroundColor: UIColors.primaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Source Sans Pro',
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
        color: UIColors.secondaryColor,
      ),
    ),
    scaffoldBackgroundColor: isDarkTheme
        ? UIColors.darkBackgroundColor
        : UIColors.lightBackgroundColor,
  );
}

extension MigoColorScheme on ColorScheme {
  Color get boxColor => brightness == Brightness.light
      ? UIColors.lightBoxColor
      : UIColors.darkBoxColor;
}
