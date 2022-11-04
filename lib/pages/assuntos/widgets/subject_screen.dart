import 'package:flutter/material.dart';
import 'package:migoc2/core/widgets/common_text_field.dart';
import 'package:migoc2/core/widgets/custom_expansion_panel_list.dart';
import 'package:migoc2/core/widgets/error_screen.dart';
import 'package:migoc2/core/widgets/loading_box.dart';
import 'package:migoc2/pages/assuntos/providers/subjects_provider.dart';
import 'package:provider/provider.dart';

class SubjectScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubjectScreen();
}

class _SubjectScreen extends State<SubjectScreen> {
  final _textController = TextEditingController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SubjectsProvider>(context, listen: false).getAssuntos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 25, 22, 40),
              child: CommonTextField(
                textFieldHint: 'Pesquise um assunto',
                textController: _textController,
              ),
            ),
            Consumer<SubjectsProvider>(
              builder: (context, value, child) {
                if (value.loading) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: LoadingBox(),
                  );
                } else if (value.assuntoError != null) {
                  ErrorScreen();
                }
                return content(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget content(BuildContext context) {
  final provider = Provider.of<SubjectsProvider>(context);
  return ListView.builder(
    shrinkWrap: true,
    itemCount: provider.assuntoModelList.length,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(22, 0, 22, 24),
        child: CustomExpansionPanelList(
          animationDuration: const Duration(milliseconds: 1000),
          children: [
            ExpansionPanel(
              body: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: provider.assuntoModelList[index].itens,
                  ),
                ],
              ),
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    provider.assuntoModelList[index].headerItem,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                );
              },
              isExpanded: provider.assuntoModelList[index].expanded,
            ),
          ],
          expansionCallback: (int item, bool status) {
            // setState(() {
            //   itemData[index].expanded = !itemData[index].expanded;
            // });
          },
        ),
      );
    },
  );
}
