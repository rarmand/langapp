import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class InputField extends StatelessWidget {
  final String title;
  final bool isPassword;

  InputField({@required this.title, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: BTN_WIDTH,
      height: BTN_HEIGHT,
      child: TextField(
        obscureText: (isPassword ? true : false),
        style: TextStyle(
          color: BLACK,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 5),
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
          hintText: this.title,
          hintStyle: TextStyle(
            color: BLACK,
          ),
        ),
      ),
    );
  }
}
