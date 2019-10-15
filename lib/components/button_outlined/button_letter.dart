import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class ButtonLetter extends StatelessWidget {
  final String character;
  final Function onTap;
  ButtonLetter({@required this.character, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        width: 44.0,
        child: Text(
          this.character,
          textAlign: TextAlign.center,
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
