import 'package:flutter/material.dart';
import 'package:migoc2/resources/colors_extensions.dart';

class GraficoPage extends StatefulWidget {
  const GraficoPage({super.key});

  @override
  State<GraficoPage> createState() => _GraficoPage();
}

class _GraficoPage extends State<GraficoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
                  'Gráfico',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    fontFamily: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1
                        ?.fontFamily,
                    color: UIColors.secondaryColor,
                  ),
                ),
      ),
      body: Center(
        child: Image.network(
          'https://static.todamateria.com.br/upload/gr/af/graficofuncaologaritmica-cke.jpg?auto_optimize=low',
          height: 200,),
      ),
    );
  }
}
