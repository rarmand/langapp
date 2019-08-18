import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class ButtonLetter extends StatelessWidget {
  String character;

  ButtonLetter({@required this.character});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Text(
          this.character,
          style: TextStyle(
            color: BROWN_DARK,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: GREEN_DARK,
          ),
          borderRadius: BorderRadius.circular(BTN_RADIUS / 2),
        ),
      ),
    );
  }
}
