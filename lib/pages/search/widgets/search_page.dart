import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:migoc2/core/widgets/card.dart';
import 'package:migoc2/core/widgets/common_text_field.dart';
import 'package:migoc2/core/widgets/loading_box.dart';
import 'package:migoc2/core/widgets/no_results.dart';
import 'package:migoc2/pages/conteudo/models/conteudo_model.dart';
import 'package:migoc2/pages/conteudo/widgets/conteudo_page.dart';
import 'package:migoc2/pages/search/provider/search_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _textController = TextEditingController();
  final _mathTextController = MathFieldEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SearchProvider>(context, listen: false).cleanData();
    });
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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      right: 12,
                      left: 11,
                      bottom: 40,
                    ),
                    child: CommonTextField(
                      isMath: provider.isMathKeyboardEnabled,
                      textFieldHint: 'Buscar conteúdo',
                      action: () {
                        provider.searchConteudo(provider.isMathKeyboardEnabled
                            ? _mathTextController
                                .currentNode.children.first.expression
                                .replaceAll(RegExp("{|}"), "")
                            : _textController.text);
                      },
                      mathTextController: _mathTextController,
                      textController: _textController,
                    ),
                  ),
                ],
              ),
            ),
            Consumer<SearchProvider>(
              builder: (context, value, child) {
                if (value.loading) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      children: [
                        LoadingBox(),
                        LoadingBox(),
                        LoadingBox(),
                        LoadingBox(),
                      ],
                    ),
                  );
                }
                if (provider.keyboardIsVisible) {
                  return Text("focus");
                } else {
                  return content(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget content(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);
    if (provider.isEmpty) {
      return semResultados();
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: provider.conteudoList.length,
      physics: const ClampingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 22, 25),
            child: SearchCard(
              title: provider.conteudoList[index].nome!,
            ),
          ),
          onTap: () => tappedContent(provider.conteudoList[index], context),
        );
      },
    );
  }
}
