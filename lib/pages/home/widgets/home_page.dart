import 'package:flutter/material.dart';
import 'package:migoc2/pages/base/navigation/provider/navigation_provider.dart';
import 'package:migoc2/resources/colors_extensions.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatelessWidget {
  final List<String> imageList = [
    'images/migo_computer.png',
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        shrinkWrap: true,
      children: [
      Center(
      child: Image.asset(
        'images/migo_happy.png',
        width: MediaQuery.of(context).size.width / 2,
        fit: BoxFit.fitWidth,
      ),
      ),
      Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Olá!",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 38,
              fontFamily:
              Theme.of(context).primaryTextTheme.bodyText1?.fontFamily,
              color: UIColors.terciaryColor,
            ),
          ),
          const Text(" "),
          Text(
            "Sou o migo",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
              fontFamily: Theme.of(context).textTheme.headline1?.fontFamily,
              color: UIColors.primaryColor,
            ),
          ),
          Text(
            "C2.",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
              fontFamily: Theme.of(context).textTheme.headline1?.fontFamily,
              color: UIColors.secondaryColor,
            ),
          ),
        ],
      ),
      ),
      Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 40,),
        child: Text(
          'Com o migoC2, você pode: ',
          style: TextStyle(
            fontFamily:
            Theme.of(context).primaryTextTheme.bodyText1?.fontFamily,
            fontSize: 20,
          ),
        ),
      ),
      ),
      GestureDetector(
        onTap: () => {
          provider.bottomTapped(1)
        },
        child: box(
        context,
        'Buscar conteúdos de Cálculo 2',
        UniconsLine.search,
        ),
      ),
      GestureDetector(
        onTap: () => {
          provider.bottomTapped(2)
        },
        child: box(
        context,
        'Acessar conteúdos de Cálculo 2 por módulos',
        UniconsLine.books,
        ),
      ),
      GestureDetector(
        onTap: () => {
          provider.bottomTapped(2)
        },
        child: box(
        context,
        'Acessar exercícios resolvidos de forma detalhada',
        UniconsLine.sigma,
        ),
      ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Center(
            child: Text(
              'Oferecimento:',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: Theme.of(context).textTheme.headline1?.fontFamily,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(
            children: [
              Image.asset(
                'images/unb_logo.jpg',
                width: 80,
              ),
              const Spacer(),
              Image.asset(
                'images/logo_a3m.png',
                width: 80,
              )
            ],
          ),
        ),
        ],
      ),
    );
  }

  Padding box(BuildContext context, String text, IconData icon) {
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
                  Icon(
                    icon,
                    color: UIColors.secondaryColor,
                    size: 38,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1
                              ?.fontFamily,
                          fontWeight: FontWeight.w600,
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
