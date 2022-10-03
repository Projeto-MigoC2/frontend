import 'package:flutter/material.dart';

@immutable
class CommonTextField extends StatelessWidget {

  final String textFieldHint;

  const CommonTextField({required this.textFieldHint});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Colors.grey.shade400,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: textFieldHint,
          suffixIcon: Ink(
            decoration: const ShapeDecoration(
              color: Color(0xFF8C52FF),
              shape: CircleBorder(),
            ),
            child: IconButton(
              onPressed: () {},
              color: const Color(0xff39EBB0),
              iconSize: 13,
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          prefixIcon: const Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
