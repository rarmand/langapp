import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool isPassword;

  String existingText;
  Function onSaved;
  Function validator;

  InputField({
    @required this.label,
    this.isPassword = false,
    this.existingText = "",
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      width: BTN_WIDTH,
      child: TextFormField(
        initialValue: this.existingText,
        validator: this.validator,
        onSaved: this.onSaved,
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
