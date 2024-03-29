import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:migoc2/pages/conteudo/models/conteudo_model.dart';
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
                title: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    widget.conteudo.nome!,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: widget.conteudo.nome!.length > 50 ? 12 : 20,
                      fontFamily: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1
                          ?.fontFamily,
                      color: UIColors.secondaryColor,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SafeArea(
                      // ignore: avoid_redundant_argument_values
                      top: true,
                      child: InteractiveViewer(
                        minScale: 1,
                        maxScale: 4,
                        panEnabled: false,
                        boundaryMargin: const EdgeInsets.all(80),
                        child: TeXView(
                          renderingEngine:
                              const TeXViewRenderingEngine.mathjax(),
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
                              fontSize: 14,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: TeXViewFontWeight.w500,
                            ),
                          ),
                        ),
                      ),
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
