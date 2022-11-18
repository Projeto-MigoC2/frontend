import 'package:flutter/material.dart';
import 'package:migoc2/resources/theme_data.dart';
import 'package:shimmer/shimmer.dart';

class LoadingBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoadingBox();
}

class _LoadingBox extends State<LoadingBox> {
  @override
  Widget build(BuildContext context) {
    const int timer = 1000;
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        color: Theme.of(context).colorScheme.boxColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            blurRadius: 2.0,
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 1),
          )
        ],
      ),
      height: 239,
      width: double.infinity,
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
