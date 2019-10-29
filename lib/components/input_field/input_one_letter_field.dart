import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

enum InputLetterState {
  CORRECT,
  INCORRECT,
}

class InputOneLetterField extends StatelessWidget {
  final String chosenLetter;
  final InputLetterState btnState;

  InputOneLetterField({@required this.chosenLetter, this.btnState});

  @override
  Widget build(BuildContext context) {
    Color color = (this.btnState == InputLetterState.CORRECT ? GREEN_DARK : BROWN_LIGHT);
    color = (this.btnState == InputLetterState.INCORRECT ? Colors.red : color);

    return Container(
      margin: EdgeInsets.all(4.0),
      padding: EdgeInsets.only(top: 8.0),
      width: 36.0,
      child: Container(
        child: Text(
          this.chosenLetter,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
