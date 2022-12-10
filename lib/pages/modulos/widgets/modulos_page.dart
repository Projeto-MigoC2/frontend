import 'package:flutter/material.dart';
import 'package:migoc2/core/widgets/custom_expansion_panel_list.dart';
import 'package:migoc2/core/widgets/error_screen.dart';
import 'package:migoc2/core/widgets/loading_box.dart';
import 'package:migoc2/pages/conteudo/models/conteudo_model.dart';
import 'package:migoc2/pages/conteudo/widgets/conteudo_page.dart';
import 'package:migoc2/pages/modulos/providers/modulos_provider.dart';
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
      Provider.of<ModulosProvider>(context, listen: false).getAssuntos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child:
          Column(
            children: [
              Consumer<ModulosProvider>(
                builder: (context, value, child) {
                  if (value.loading) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
                      child: LoadingBox(),
                    );
                  } else if (value.assuntoError != null) {
                    ErrorScreen();
                  }
                  return SafeArea(child: content(context));
                },
              ),
            ],
          ),
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
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: provider.assuntoModelList.length,
        itemBuilder: (BuildContext context, int builderIndex) {
          return CustomExpansionPanelList(
            animationDuration: const Duration(milliseconds: 500),
            children: [
              ExpansionPanel(
                isExpanded: provider.assuntoModelList[builderIndex].expanded,
                body: Align(
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.assuntoModelList[builderIndex].itens.length,
                    itemBuilder: (BuildContext context, int index2) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: (){
                              tappedContent(provider.assuntoList[builderIndex].conteudos![index2], context);
                            },
                            child: Text(
                              provider.assuntoModelList[builderIndex].itens[index2],
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      provider.assuntoModelList[builderIndex].headerItem,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
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
    );
  }
}


