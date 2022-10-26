import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:migoc2/pages/base/navigation/provider/navigation_provider.dart';
import 'package:migoc2/resources/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

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
    final provider = Provider.of<NavigationProvider>(context);
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.10))
      ]),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10.0, right: 10, top: 15.0, bottom: 25),
        child: GNav(
          selectedIndex: provider.selectedIndex,
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          backgroundColor: Colors.white,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          color: Colors.black,
          activeColor: Colors.white,
          tabBackgroundGradient: LinearGradient(
              colors: [Theme.of(context).primaryColor, Color(0xffb996fd)]),
          tabBorderRadius: 20,
          gap: 10,
          onTabChange: provider.bottomTapped,
          tabs: const [
            GButton(
              icon: UniconsLine.home_alt,
              text: 'Início',
            ),
            GButton(
              icon: UniconsLine.search,
              text: 'Pesquisar',
            ),
            GButton(
              icon: UniconsLine.books,
              text: 'Assuntos',
            ),
            GButton(
              icon: UniconsLine.setting,
              text: 'Ajustes',
            )
          ],
        ),
      ),
    );
    // return Consumer<DarkThemeProvider>(
    //   builder: (context, theme, child) => DecoratedBox(
    //     decoration: const BoxDecoration(
    //       borderRadius: BorderRadius.only(
    //         topRight: Radius.circular(12),
    //         topLeft: Radius.circular(12),
    //       ),
    //       boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 6)],
    //     ),
    //     child: ClipRRect(
    //       borderRadius: const BorderRadius.only(
    //         topLeft: Radius.circular(12.0),
    //         topRight: Radius.circular(12.0),
    //       ),
    //       child: BottomNavigationBar(
    //         type: BottomNavigationBarType.fixed,
    //         items: <BottomNavigationBarItem>[
    //           const BottomNavigationBarItem(
    //             icon: Icon(
    //               CupertinoIcons.search,
    //             ),
    //             label: 'Pesquisar',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(
    //               context.watch<NavigationProvider>().selectedIndex == 1
    //                   ? CupertinoIcons.book_fill
    //                   : CupertinoIcons.book,
    //             ),
    //             label: 'Assuntos',
    //           )
    //         ],
    //         currentIndex: context.watch<NavigationProvider>().selectedIndex,
    //         onTap: context.watch<NavigationProvider>().bottomTapped,
    //       ),
    //     ),
    //   ),
    // );
  }
}
