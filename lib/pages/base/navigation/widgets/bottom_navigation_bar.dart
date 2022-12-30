import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:migoc2/pages/base/navigation/provider/navigation_provider.dart';
import 'package:migoc2/resources/colors_extensions.dart';
import 'package:migoc2/resources/theme_data.dart';
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
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.boxColor,
        boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.10))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
          bottom: 25,
        ),
        child: GNav(
          selectedIndex: provider.selectedIndex,
          textStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).backgroundColor,
          ),
          gap: 5,
          backgroundColor: Theme.of(context).colorScheme.boxColor,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          color: Theme.of(context).focusColor,
          activeColor: Theme.of(context).backgroundColor,
          tabBackgroundGradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              UIColors.primaryColor.withOpacity(0.5),
            ],
          ),
          tabBorderRadius: 20,
          onTabChange: provider.bottomTapped,
          tabs: [
            GButton(
              icon: UniconsLine.home_alt,
              text: 'Início',
              iconActiveColor: UIColors.secondaryColor,
            ),
            GButton(
              icon: UniconsLine.search,
              text: 'Pesquisar',
              iconActiveColor: UIColors.secondaryColor,
            ),
            GButton(
              icon: UniconsLine.books,
              text: 'Módulos',
              iconActiveColor: UIColors.secondaryColor,
            ),
            GButton(
              icon: UniconsLine.setting,
              text: 'Ajustes',
              iconActiveColor: UIColors.secondaryColor,
            )
          ],
        ),
      ),
    );
  }
}
