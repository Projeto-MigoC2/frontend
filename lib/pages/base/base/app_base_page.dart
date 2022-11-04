import 'package:flutter/material.dart';
import 'package:migoc2/pages/assuntos/widgets/subject_screen.dart';
import 'package:migoc2/pages/base/navigation/controllers/page_controller.dart';
import 'package:migoc2/pages/base/navigation/provider/navigation_provider.dart';
import 'package:migoc2/pages/base/navigation/widgets/bottom_navigation_bar.dart';
import 'package:migoc2/pages/home/widgets/home_page.dart';
import 'package:migoc2/pages/search/widgets/search_page.dart';
import 'package:migoc2/resources/theme_data.dart';
import 'package:provider/provider.dart';

class AppBase extends StatefulWidget {
  const AppBase({super.key});

  @override
  State<AppBase> createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> {
  List<String> titles = ['Início', 'Pesquisar', 'Assuntos', 'Configurações'];
  static const String appTitle = 'migoC2';

  List<Widget> pages = [const HomePage(), const SearchPage(), SubjectScreen()];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);
    return MaterialApp(
      title: appTitle,
      theme: themeData(isDarkTheme: false, context: context),
      darkTheme: themeData(isDarkTheme: true, context: context),
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(titles[provider.selectedIndex]),
            ),
            body: PageView(
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
