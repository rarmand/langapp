import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class InputOneLetterField extends StatelessWidget {
  final String chosenLetter;

  InputOneLetterField({@required this.chosenLetter});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.only(top: 8.0),
      width: 36.0,
      child: Container(
        child: Text(
          this.chosenLetter,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: BROWN_DARK,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: BROWN_DARK,
            ),
          ),
        ),
      ),
    );
  }
}
