import 'package:flutter/material.dart';
import 'package:migoc2/pages/Base/bottom_navigation_bar/provider/bottom_navigation_bar_provider.dart';
import 'package:migoc2/pages/Base/base/app_base.dart';
import 'package:migoc2/resources/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'assuntos/view_models/assuntos_view_model.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AssuntosViewModel()),
            ChangeNotifierProvider(create: (context) => DarkThemeProvider()),
            ChangeNotifierProvider(create: (context) => BottomBarProvider()),
          ],
          child: const AppBaseHomePage()
  )
  );
}
