import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:migoc2/pages/conteudo/models/conteudo_model.dart';
import 'package:migoc2/pages/conteudo/widgets/grafico_page.dart';
import 'package:migoc2/resources/colors_extensions.dart';

class ConteudoPage extends StatefulWidget {
  const ConteudoPage({super.key, required this.conteudo});
  final Conteudo conteudo;

  @override
  State<ConteudoPage> createState() => _ConteudoPage();
}

class _ConteudoPage extends State<ConteudoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.conteudo.nome!,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              fontFamily: Theme.of(context)
                .primaryTextTheme
                .bodyText1
                ?.fontFamily,
                color: UIColors.secondaryColor,
              
            ),
          ),
      ),
      body: Ink(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Palavras-Chave:',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GraficoPage()),
                      )
                    },
                    child: const Text('Gráfico'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GraficoPage()),
                      )
                    },
                    child: const Text('Gráfico'),
                  ),
                ),
                SafeArea(
                  child: TeXView(
                    renderingEngine: const TeXViewRenderingEngine.katex(),
                    child: TeXViewDocument(widget.conteudo.corpo!),
                    style: TeXViewStyle(
                      backgroundColor: Theme.of(context).backgroundColor,
                      contentColor:
                          Theme.of(context).primaryTextTheme.bodyText1?.color,
                      padding: const TeXViewPadding.only(
                        left: 20,
                        right: 20,
                      ),
                      fontStyle: TeXViewFontStyle(
                        fontSize: 20,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: TeXViewFontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
