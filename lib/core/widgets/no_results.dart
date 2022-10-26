import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget semResultados() {
  return Center(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 30),
          child: SvgPicture.asset(
            'images/not_found.svg',
            width: 150,
            height: 150,
          ),
        ),
        const Text(
          'Sem resultados',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
      ],
    ),
  );
}
