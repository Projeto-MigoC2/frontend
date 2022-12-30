import 'package:flutter/material.dart';
import 'package:migoc2/core/widgets/custom_expansion_panel_list.dart';
import 'package:migoc2/core/widgets/error_screen.dart';
import 'package:migoc2/core/widgets/loading_box.dart';
import 'package:migoc2/core/widgets/modules_loading_box.dart';
import 'package:migoc2/pages/conteudo/models/conteudo_model.dart';
import 'package:migoc2/pages/conteudo/widgets/conteudo_page.dart';
import 'package:migoc2/pages/modulos/providers/modulos_provider.dart';
import 'package:migoc2/resources/colors_extensions.dart';
import 'package:provider/provider.dart';

class ModulosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ModulosPage();
}

class _ModulosPage extends State<ModulosPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ModulosProvider>(context, listen: false).getModulos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Consumer<ModulosProvider>(
            builder: (context, value, child) {
              if (value.loading) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
                  child: Column(
                    children: [
                      ModulesLoadingBox(),
                      ModulesLoadingBox(),
                      ModulesLoadingBox(),
                    ],
                  ),
                );
              } else if (value.moduloError != null) {
                ErrorScreen();
              }
              return SafeArea(child: content(context));
            },
          ),
        ],
      ),
    );
  }
  void tappedContent(Conteudo conteudo, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConteudoPage(
          conteudo: conteudo,
        ),
      ),
    );
  }

  Widget content(BuildContext context) {
    final provider = Provider.of<ModulosProvider>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
      child: RefreshIndicator(
        onRefresh: provider.getModulos,
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 254,
          child: ListView.builder(
            shrinkWrap: true,
            clipBehavior: Clip.none,
            itemCount: provider.moduloModelList.length,
            itemBuilder: (BuildContext context, int builderIndex) {
              return CustomExpansionPanelList(
                animationDuration: const Duration(milliseconds: 500),
                children: [
                  ExpansionPanel(
                    isExpanded: provider.moduloModelList[builderIndex].expanded,
                    body: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: provider.moduloList[builderIndex].conteudos!.map<Padding>(
                                (l) => Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: UIColors.terciaryColor
                                      ),
                                      onPressed: (){
                                        tappedContent(l, context);
                                      },
                                      child: Text(
                                        l.nome!,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ).toList(),
                      ),
                    ),
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return InkWell(
                        splashFactory: NoSplash.splashFactory,
                        splashColor: Colors.transparent,
                        onTap: () { provider.setExpandedData(builderIndex);},
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            provider.moduloModelList[builderIndex].headerItem,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: UIColors.secondaryColor
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
                expansionCallback: (int index, bool value) {
                  provider.setExpandedData(builderIndex);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}


