import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

enum ButtonOutlinedState {
  CORRECT,
  INCORRECT,
}

// idea of Flutter's raised button with transparent background
class ButtonAnswerOutlined extends StatelessWidget {
  final String btnText;
  Function onPressed;
  final ButtonOutlinedState btnState;

  ButtonAnswerOutlined({@required this.btnText, this.btnState, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color color = (btnState == ButtonOutlinedState.CORRECT ? GREEN_DARK : BROWN_DARK);
    color = (btnState == ButtonOutlinedState.INCORRECT ? Colors.red : color);

    return Container(
      margin: EdgeInsets.all(4.0),
      width: BTN_WIDTH,
      height: BTN_HEIGHT + 20,
      decoration: BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS / 2)),
        border: Border.all(
          color: color,
        ),
      ),
      child: RaisedButton(
        elevation: 0.0,
        color: (btnState != null ? color.withOpacity(0.2) : WHITE),
        textColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BTN_RADIUS / 2),
        ),
        child: Text(
          this.btnText,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16.0,
          ),
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}
