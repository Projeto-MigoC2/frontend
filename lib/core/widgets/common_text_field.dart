import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:migoc2/resources/colors_extensions.dart';

class CommonTextField extends StatefulWidget {
  final String textFieldHint;
  final VoidCallback? action;
  final FocusNode focus = FocusNode();
  final MathFieldEditingController mathTextController;
  final TextEditingController textController;
  final bool isMath;

  CommonTextField({
    required this.textFieldHint,
    required this.isMath,
    required this.action,
    required this.mathTextController,
    required this.textController,
    super.key,
  });

  @override
  State<CommonTextField> createState() => _CommonTextField();
}

class _CommonTextField extends State<CommonTextField> {
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
      child: widget.isMath ? mathTextField(context) : textField(context),
    ); //
  }

  Widget mathTextField(BuildContext context) {
    return MathField(
      controller: widget.mathTextController,
      variables: const ['x', 'dx', '\\int', '\\sum_{}'],
      decoration: InputDecoration(
        focusColor: Theme.of(context).focusColor,
        hintText: widget.textFieldHint,
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
                onPressed: widget.action,
                color: UIColors.secondaryColor,
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
            color: widget.focus.hasFocus ? Theme.of(context).focusColor : null,
          ),
        ),
      ),
      focusNode: widget.focus,
    );
  }

  Widget textField(BuildContext context) {
    return TextField(
      controller: widget.textController,
      onTap: () => FocusScope.of(context).requestFocus(widget.focus),
      onSubmitted: (value) {widget.action;},
      focusNode: widget.focus,
      decoration: InputDecoration(
        focusColor: Theme.of(context).focusColor,
        hintText: widget.textFieldHint,
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
                onPressed: widget.action,
                color: UIColors.secondaryColor,
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
            color: widget.focus.hasFocus ? Theme.of(context).focusColor : null,
          ),
        ),
      ),
    );
  }
}
