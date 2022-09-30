import 'package:flutter/material.dart';
import 'package:migoc2/pages/subjects/widgets/common_text_field.dart';
import 'package:migoc2/pages/subjects/widgets/custom_expansion_panel_list.dart';
import 'package:migoc2/pages/subjects/widgets/item_data.dart';

class SubjectScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubjectScreen();
}

class _SubjectScreen extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const CommonTextField(textFieldHint: 'Pesquise um assunto'),
            Expanded(
              child: Scrollbar(
                thickness: 0,
                child: ListView.builder(
                  itemCount: itemData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomExpansionPanelList(
                      animationDuration: const Duration(milliseconds: 1000),
                      children: [
                        ExpansionPanel(
                          body: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: itemData[index].itens,
                              ),
                            ],
                          ),
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                itemData[index].headerItem,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            );
                          },
                          isExpanded: itemData[index].expanded,
                        ),
                      ],
                      expansionCallback: (int item, bool status) {
                        setState(() {
                          itemData[index].expanded = !itemData[index].expanded;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<ItemModel> itemData = <ItemModel>[
  ItemModel(
    headerItem: 'Pré-Cálculo',
    itens: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              'Pré-Cálculo: Resumo',
              style: TextStyle(
                color: Color(0xff39EBB0),
                fontSize: 17,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xff39EBB0),
              size: 13,
            ),
          ],
        ),
      ],
    ),
  ),
  ItemModel(
    headerItem: 'Séries e Sequências',
    itens: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              'Séries e Sequências: Resumo',
              style: TextStyle(
                color: Color(0xff39EBB0),
                fontSize: 17,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xff39EBB0),
              size: 13,
            ),
          ],
        ),
      ],
    ),
  ),
  ItemModel(
    headerItem: 'Equações Diferenciais',
    itens: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              'Equações Diferenciais: Resumo',
              style: TextStyle(
                color: Color(0xff39EBB0),
                fontSize: 17,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xff39EBB0),
              size: 13,
            ),
          ],
        ),
      ],
    ),
  ),
  ItemModel(
    headerItem: 'Transformada de Laplace',
    itens: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              'Transformada de Laplace: Resumo',
              style: TextStyle(
                color: Color(0xff39EBB0),
                fontSize: 17,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xff39EBB0),
              size: 13,
            ),
          ],
        ),
      ],
    ),
  ),
];
