import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:migoc2/pages/Base/bottom_navigation_bar/provider/bottom_navigation_bar_provider.dart';
import 'package:migoc2/resources/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return _BottomBar();
  }
}

class _BottomBar extends StatefulWidget {
  @override
   State<_BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<_BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
      builder: (context, theme, child) => DecoratedBox(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, blurRadius: 6)
            ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                      CupertinoIcons.home,
                  ),
                  label: 'Início',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                      CupertinoIcons.search,
                  ),
                  label: 'Pesquisar',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                      CupertinoIcons.book,
                  ),
                label: 'Assuntos',
              )
            ],
            currentIndex: context.watch<BottomBarProvider>().selectedIndex,
            onTap: context.watch<BottomBarProvider>().onItemTapped,
          ),
        ),
      ),
    );
  }
}
