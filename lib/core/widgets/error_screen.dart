import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ErrorScreenSubjects();
}

class _ErrorScreenSubjects extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('images/smartphone 1.png'),
          height: 190,
        ),
        Column(
          children: const [
            Text(
              'Erro: código 404',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'A página não foi encontrada',
              style: TextStyle(
                color: Color(0xFFA1A1A1),
              ),
            ),
          ],
        )
      ],
    );
  }
}
