import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class SmallInputField extends StatefulWidget {
  String text;

  SmallInputField({@required this.text});

  @override
  _SmallInputFieldState createState() => _SmallInputFieldState(text: this.text);
}

class _SmallInputFieldState extends State<SmallInputField> {
  String text;

  _SmallInputFieldState({@required this.text}) {
    this.text = this.text.substring(0, this.text.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      child: TextFormField(
        initialValue: this.text,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 2,
        style: TextStyle(
          color: WHITE,
          fontSize: 22.0,
          fontFamily: "Roboto",
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          suffixText: "%",
          suffixStyle: TextStyle(
            color: WHITE,
            fontSize: 22.0,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
          ),
          counterText: "",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: WHITE,
            ),
          ),
        ),
      ),
    );
  }
}
