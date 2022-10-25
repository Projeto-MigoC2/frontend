import 'package:flutter/material.dart';
import 'package:migoc2/resources/colors_extensions.dart';

@immutable
class SearchCard extends StatelessWidget {
  final String title;
  final String resume;

  const SearchCard({required this.title, required this.resume});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 22),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
                color: UIColors.secondaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
            child: Text(
              resume,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
