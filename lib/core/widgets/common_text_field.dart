import 'package:flutter/material.dart';
import 'package:migoc2/resources/colors_extensions.dart';

@immutable
class CommonTextField extends StatelessWidget {
  final String textFieldHint;
  final VoidCallback? action;
  final TextEditingController? textController;
  final FocusNode focus = FocusNode();

  CommonTextField({
    required this.textFieldHint,
    this.action,
    this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black.withOpacity(0.20),
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            blurRadius: 2,
            color: Colors.black.withOpacity(0.20),
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: TextField(
        onTap: () => FocusScope.of(context).requestFocus(focus),
        focusNode: focus,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          focusColor: Colors.black,
          hintText: textFieldHint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Ink(
            decoration: const ShapeDecoration(
              color: Color(0xFF8C52FF),
              shape: CircleBorder(),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: UIColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: action,
                  color: const Color(0xff39EBB0),
                  iconSize: 13,
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 18, right: 29),
            child: Icon(
              Icons.search,
              size: 30.0,
              color: focus.hasFocus ? Colors.black : null,
            ),
          ),
        ),
        controller: textController,
      ),
    );
  }
}
