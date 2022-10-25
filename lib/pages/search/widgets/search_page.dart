import 'package:flutter/material.dart';
import 'package:migoc2/core/widgets/card.dart';
import 'package:migoc2/core/widgets/common_text_field.dart';
import 'package:migoc2/core/widgets/loading_box.dart';
import 'package:migoc2/core/widgets/no_results.dart';
import 'package:migoc2/models/conteudo_model.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SearchProvider>(context, listen: false)
          .setIsEmpty(isEmpty: false);
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
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
                right: 22,
                left: 22,
                bottom: 40,
              ),
              child: CommonTextField(
                textFieldHint: 'Procurar',
                action: () {
                  provider.searchConteudo(_textController.text);
                },
                textController: _textController,
              ),
            ),
            Consumer<SearchProvider>(
              builder: (context, value, child) {
                if (value.loading) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: LoadingBox(),
                  );
                }
                return content(context);
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
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 22, 25),
            child: SearchCard(
              title: provider.conteudoList[index].titulo!,
              resume: provider.conteudoList[index].resumo!,
            ),
          ),
          onTap: () => tappedContent(provider.conteudoList[index], context),
        );
      },
    );
  }
}
