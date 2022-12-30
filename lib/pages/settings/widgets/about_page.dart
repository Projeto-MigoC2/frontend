import 'package:flutter/material.dart';
import 'package:migoc2/resources/colors_extensions.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'images/migo_computer.png',
                width: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      offset: const Offset(1, 1),
                      spreadRadius: 0.2,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'O migoC2 é um app desenvolvido por estudantes da Universidade de Brasília - Faculdade do Gama para facilitar a aprendizagem na disciplina de Cálculo 2. Esse app foi financiado pelo Programa Aprendizagem para o 3º Milênio (A3M), que tem como objetivo atuar junto à comunidade da Universidade de Brasília na identificação, valorização e promoção de ações educacionais inovadoras, visando disponibilizar um portfólio sustentável de metodologias, processos e aplicativos para uso nos cursos da universidade.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: Theme.of(context)
                          .primaryTextTheme
                          .bodyText1
                          ?.fontFamily,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Integrantes',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: UIColors.primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: boxMember(
                context,
                'Luiza Yoko Taneguti - Orientadora',
                'images/yoko.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: boxMember(
                context,
                'Guilherme Daniel Fernandes da Silva - Desenvolvedor',
                'images/guilherme.jpeg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: boxMember(
                context,
                'Victório Lázaro Rocha de Morais - Desenvolvedor',
                'images/victorio.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: boxMember(
                context,
                'Leonardo Lago Moreno - Desenvolvedor',
                'images/leonardo.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                right: 10
              ),
              child: boxMember(
                context,
                'Vitor - Criador de Conteúdo',
                'images/vitor.jpeg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  children: [
                    Image.asset(
                      'images/unb_logo.jpg',
                      width: 80,
                    ),
                    Spacer(),
                    Image.asset(
                      'images/logo_a3m.png',
                      width: 80,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding boxMember(BuildContext context, String name, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                offset: const Offset(1, 1),
                spreadRadius: 0.2,
                color: Colors.black.withOpacity(0.5),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
                    radius: 60,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1
                              ?.fontFamily,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
