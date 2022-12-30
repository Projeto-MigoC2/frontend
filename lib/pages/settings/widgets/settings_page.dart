import 'package:flutter/material.dart';
import 'package:migoc2/pages/settings/widgets/about_page.dart';
import 'package:migoc2/resources/colors_extensions.dart';
import 'package:migoc2/resources/theme_data.dart';
import 'package:unicons/unicons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: ListView(
          children: ListTile.divideTiles(
            color: Theme.of(context).colorScheme.boxColor,
            context: context,
            tiles: [
              Card(
                child: ListTile(
                  tileColor: Theme.of(context).colorScheme.boxColor,
                  leading: Icon(
                    UniconsLine.info_circle,
                    color: UIColors.secondaryColor,
                  ),
                  title: const Text(
                    'Sobre',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AboutPage()));
                  },
                ),
              )
            ],
          ).toList(),
        ),
      ),
    );
  }
}
