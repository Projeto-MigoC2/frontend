import 'package:flutter/material.dart';
import 'package:migoc2/resources/colors_extensions.dart';

Widget semResultados() {
  return Center(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 30),
          child: Image.asset(
            'images/migo_computer.png',
            width: 200,
          ),
        ),
        Text(
          'Sem resultados',
          style: TextStyle(
            color: UIColors.secondaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
      ],
    ),
  );
}
