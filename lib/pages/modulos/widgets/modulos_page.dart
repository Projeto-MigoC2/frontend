import 'package:flutter/material.dart';
import 'package:migoc2/core/widgets/custom_expansion_panel_list.dart';
import 'package:migoc2/core/widgets/error_screen.dart';
import 'package:migoc2/core/widgets/loading_box.dart';
import 'package:migoc2/pages/conteudo/models/conteudo_model.dart';
import 'package:migoc2/pages/conteudo/widgets/conteudo_page.dart';
import 'package:migoc2/pages/modulos/providers/modulos_provider.dart';
import 'package:migoc2/pages/search/provider/search_provider.dart';
import 'package:provider/provider.dart';

class ModulosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ModulosPage();
}

class _ModulosPage extends State<ModulosPage> {
  final _textController = TextEditingController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ModulosProvider>(context, listen: false).getAssuntos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);
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
                      padding: const EdgeInsets.symmetric(horizontal: 22),
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
    return ListView.builder(
      shrinkWrap: true,
      itemCount: provider.assuntoModelList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
          child: CustomExpansionPanelList(
            animationDuration: const Duration(milliseconds: 500),
            children: [
              ExpansionPanel(
                body: Align(
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.assuntoModelList[index].itens.length,
                    itemBuilder: (BuildContext context, int index2) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: (){
                              tappedContent(provider.assuntoList[index].conteudos![index2], context);
                            },
                            child: Text(
                              provider.assuntoModelList[index].itens[index2],
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600
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
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      provider.assuntoModelList[index].headerItem,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                },
                isExpanded: provider.assuntoModelList[index].expanded,
              ),
            ],
            expansionCallback: (int index, bool value) {
              provider.setExpandedData(index);
            },
          ),
        );
      },
    );
  }
}


