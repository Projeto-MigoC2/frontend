import 'package:flutter/material.dart';
import 'package:migoc2/pages/subjects/widgets/common_text_field.dart';

class ErrorScreenSearch  extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ErrorScreenSearch ();
}

class _ErrorScreenSearch extends State<ErrorScreenSearch > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const CommonTextField(textFieldHint: 'Procurar'),
            Column(
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
            ),
          ],
        ),
      ),
    );
  }
}