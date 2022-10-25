import 'package:flutter/material.dart';
import 'package:migoc2/models/conteudo_model.dart';
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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  widget.conteudo.titulo!,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                    color: UIColors.secondaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Resumo: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    TextSpan(
                      text: widget.conteudo.resumo,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                widget.conteudo.elaboracao!,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
