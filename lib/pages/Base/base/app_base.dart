import 'package:flutter/material.dart';
import 'package:migoc2/resources/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import '../../../resources/theme_data.dart';
import '../bottom_navigation_bar/widgets/bottom_navigation_bar.dart';

class AppBase extends StatelessWidget {
  const AppBase({Key? key}) : super(key: key);

  static const String _titulo = 'migoC2';

  @override
  Widget build(BuildContext context) {
    return AppBaseHomePage();
  }
}

class AppBaseHomePage extends StatefulWidget {
  const  AppBaseHomePage({Key? key}) : super(key: key);

  @override
  State<AppBaseHomePage> createState() => _AppBaseHomePageState();
}

class _AppBaseHomePageState extends State<AppBaseHomePage> {

  static const String _titulo = 'migoC2';

  static final List<Widget> _appBars = [

  ];


  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
        builder: (context, theme, child) => MaterialApp(
          title: _titulo,
          themeMode: ThemeMode.system,
          theme: Styles.themeData(theme.darkTheme, context),
          home: Scaffold(
              appBar: AppBar(
                title: const Text(_titulo),
              ),
              body: Container(
                color: Styles.themeData(theme.darkTheme, context).backgroundColor,
                child: const Text('View'),
              ),
              bottomNavigationBar: const BottomBar(),
        ),
    )
    );
  }
}
