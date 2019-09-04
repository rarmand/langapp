import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool isPassword;
  String existingText;

  InputField({@required this.label, this.isPassword = false, this.existingText = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      width: BTN_WIDTH,
      height: BTN_HEIGHT,
      child: TextFormField(
        initialValue: this.existingText,
        obscureText: (isPassword ? true : false),
        style: TextStyle(
          color: BLACK,
        ),
        decoration: InputDecoration(
          labelText: this.label,
          labelStyle: TextStyle(color: BROWN_DARK),
          contentPadding: EdgeInsets.only(bottom: 4),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: BROWN_DARK,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: GREEN_DARK,
            ),
          ),
        ),
      ),
    );
  }
}
