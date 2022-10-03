import 'package:flutter/material.dart';
import 'package:migoc2/pages/subjects/widgets/common_text_field.dart';
import 'package:shimmer/shimmer.dart';

class LoadingScreenSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadingScreenSearch();
}

class _LoadingScreenSearch extends State<LoadingScreenSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const CommonTextField(textFieldHint: 'Procurar'),
            Expanded(
                child: Scrollbar(
                  thickness: 0,
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext ctx, index) {
                        const int timer = 1000;
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.white,                            
                          ),
                          height: 239,
                          width: 344,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.white,
                                period: const Duration(milliseconds: timer),
                                child: boxes(),
                              ),
                            ],
                          ),
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

  Widget boxes() {
    return Column(
      children: [
        Container(
          width: 300,
          height: 25,
          color: Colors.grey,
          margin: const EdgeInsets.only(bottom: 10.0),
        ),
        Container(
          width: 150,
          height: 25,
          color: Colors.grey,
          margin: const EdgeInsets.only(bottom: 30.0),
        ),
      ],
    );
  }
}
