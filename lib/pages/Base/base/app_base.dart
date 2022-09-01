import 'package:flutter/material.dart';
import 'package:migoc2/pages/Base/bottom_navigation_bar/widgets/bottom_navigation_bar.dart';
import 'package:migoc2/resources/dark_theme_provider.dart';
import 'package:migoc2/resources/theme_data.dart';
import 'package:provider/provider.dart';

class AppBase extends StatelessWidget {
  const AppBase({super.key});

  static const String _titulo = 'migoC2';

  @override
  Widget build(BuildContext context) {
    return const AppBaseHomePage();
  }
}

class AppBaseHomePage extends StatefulWidget {
  const  AppBaseHomePage({super.key});

  @override
  State<AppBaseHomePage> createState() => _AppBaseHomePageState();
}

class _AppBaseHomePageState extends State<AppBaseHomePage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
        builder: (context, theme, child) => MaterialApp(
          title: AppBase._titulo,
          theme: themeData(isDarkTheme: theme.darkTheme, context: context),
          home: Scaffold(
              appBar: AppBar(
                title: const Text(AppBase._titulo),
              ),
              body: const Text('View'),
              bottomNavigationBar: const BottomBar(),
        ),
    ),
    );
  }
}
