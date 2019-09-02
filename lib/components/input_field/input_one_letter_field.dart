import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class InputOneLetterField extends StatefulWidget {
  @override
  _InputOneLetterFieldState createState() => _InputOneLetterFieldState();
}

class _InputOneLetterFieldState extends State<InputOneLetterField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.only(top: 4.0),
      width: 36.0,
      child: TextField(
        readOnly: true,
        textCapitalization: TextCapitalization.characters,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        maxLength: 1,
        style: TextStyle(
          color: BROWN_DARK,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          counterText: "",
          contentPadding: EdgeInsets.only(bottom: 4.0),
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
