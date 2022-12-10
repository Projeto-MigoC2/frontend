import 'package:flutter/material.dart';
import 'package:migoc2/resources/colors_extensions.dart';
import 'package:migoc2/resources/theme_data.dart';

@immutable
class SearchCard extends StatelessWidget {
  final String title;

  const SearchCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 150,
      ),
      width: 340,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.boxColor,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            blurRadius: 2.0,
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Align(
          alignment: Alignment.centerLeft,
          child:
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: UIColors.secondaryColor,
                ),
              ),
            ),
        ),
      ),
    );
  }
}
