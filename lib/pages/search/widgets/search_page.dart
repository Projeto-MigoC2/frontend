import 'package:flutter/material.dart';
import 'package:migoc2/pages/subjects/widgets/common_text_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: const [
            CommonTextField(textFieldHint: 'Procurar'),
          ],
        ),
      ),
    );
  }
}
