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
      body: Ink(
        child: Center(
          child: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverAppBar.large(
                title: Text(
                  widget.conteudo.nome!,
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
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      children: [
                        TextButton(
                          onPressed: () => {
                            Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => const GraficoPage()))
                          }, 
                          child: const Text('Gráfico'),),
                        SafeArea(
                          child: TeXView(
                            renderingEngine: const TeXViewRenderingEngine.katex(),
                            child: TeXViewDocument(widget.conteudo.corpo!),
                            style: TeXViewStyle(
                              backgroundColor: Theme.of(context).backgroundColor,
                              contentColor: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyText1
                                  ?.color,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
