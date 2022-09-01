import 'package:flutter/material.dart';
import 'package:migoc2/pages/base/base/app_base_page.dart';
import 'package:migoc2/pages/base/navigation/provider/navigation_provider.dart';
import 'package:migoc2/pages/subjects/providers/subjects_provider.dart';
import 'package:migoc2/resources/dark_theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => SubjectsProvider()),
            ChangeNotifierProvider(create: (context) => DarkThemeProvider()),
            ChangeNotifierProvider(create: (context) => NavigationProvider()),
          ],
          child: const AppBase(),
  ),
  );
}
