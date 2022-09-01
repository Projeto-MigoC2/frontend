import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:migoc2/pages/base/navigation/provider/navigation_provider.dart';
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
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    context.watch<NavigationProvider>().selectedIndex == 0 ? CupertinoIcons.house_fill :  CupertinoIcons.house,
                  ),
                  label: 'Início',
              ),
              const BottomNavigationBarItem(
                  icon: Icon(
                      CupertinoIcons.search,
                  ),
                  label: 'Pesquisar',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    context.watch<NavigationProvider>().selectedIndex == 2 ? CupertinoIcons.book_fill : CupertinoIcons.book,
                  ),
                label: 'Assuntos',
              )
            ],
            currentIndex: context.watch<NavigationProvider>().selectedIndex,
            onTap: context.watch<NavigationProvider>().bottomTapped,
          ),
        ),
      ),
    );
  }
}
