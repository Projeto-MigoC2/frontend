import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:migoc2/pages/base/base/app_base_page.dart';
import 'package:migoc2/pages/base/navigation/provider/navigation_provider.dart';
import 'package:migoc2/pages/modulos/providers/modulos_provider.dart';
import 'package:migoc2/pages/search/provider/search_provider.dart';
import 'package:migoc2/resources/dark_theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  _setupLogging();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ModulosProvider()),
        ChangeNotifierProvider(create: (context) => DarkThemeProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
      ],
      child: const AppBase(),
    ),
  );
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    if (kDebugMode) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    }
  });
}
