import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool isPassword;
  bool isValidated;
  String existingText;

  InputField({@required this.label, this.isPassword = false, this.existingText = "", this.isValidated = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      width: BTN_WIDTH,
      child: TextFormField(
        initialValue: this.existingText,
        validator: (input) => input.isEmpty ? "The field can\'t be empty!" : null,
        onSaved: (input) => null,
        //
        style: TextStyle(color: BLACK),
        obscureText: (isPassword ? true : false),
        decoration: InputDecoration(
          labelText: this.label,
          labelStyle: TextStyle(color: BROWN_DARK),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: BROWN_DARK),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: GREEN_DARK),
          ),
        ),
      ),
    );
  }
}
