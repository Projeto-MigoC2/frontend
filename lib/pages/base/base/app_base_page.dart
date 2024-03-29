import 'package:flutter/material.dart';
import 'package:migoc2/pages/base/navigation/controllers/page_controller.dart';
import 'package:migoc2/pages/base/navigation/provider/navigation_provider.dart';
import 'package:migoc2/pages/base/navigation/widgets/bottom_navigation_bar.dart';
import 'package:migoc2/pages/home/widgets/home_page.dart';
import 'package:migoc2/pages/modulos/widgets/modulos_page.dart';
import 'package:migoc2/pages/search/widgets/search_page.dart';
import 'package:migoc2/pages/settings/widgets/settings_page.dart';
import 'package:migoc2/resources/theme_data.dart';
import 'package:provider/provider.dart';

class AppBase extends StatefulWidget {
  const AppBase({super.key});

  @override
  State<AppBase> createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> {
  List<String> titles = ['Início', 'Pesquisar', 'Módulos', 'Ajustes'];
  static const String appTitle = 'migoC2';

  List<Widget> pages = [
    HomePage(),
    const SearchPage(),
    ModulosPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: themeData(isDarkTheme: false, context: context),
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(titles[provider.selectedIndex]),
            ),
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: pages,
            ),
            bottomNavigationBar: const BottomBar(),
          );
        },
      ),
    );
  }
}
