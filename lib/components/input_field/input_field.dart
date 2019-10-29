import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

enum InputState { CORRECT, INCORRECT }

class InputField extends StatelessWidget {
  final bool isPassword;

  final String label;
  final String existingText;

  final Function onSaved;
  final Function validator;
  final TextEditingController controller;
  final InputState inputState;

  InputField({
    @required this.label,
    this.isPassword = false,
    this.existingText,
    this.validator,
    this.onSaved,
    this.controller,
    this.inputState,
  });

  Color getInputColor() {
    if (this.inputState == InputState.CORRECT) {
      return GREEN_DARK;
    }
    if (this.inputState == InputState.INCORRECT) {
      return Colors.red;
    }
    return BROWN_DARK;
  }

  @override
  Widget build(BuildContext context) {
    final color = getInputColor();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      width: BTN_WIDTH,
      child: TextFormField(
        initialValue: this.existingText,
        validator: this.validator,
        controller: this.controller,
        onSaved: this.onSaved,
        style: TextStyle(color: color),
        obscureText: (isPassword ? true : false),
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.red[900]),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          labelText: this.label,
          labelStyle: TextStyle(color: color),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
        ),
      ),
    );
  }
}
