import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

// idea of Flutter's raised button with transparent background
class ButtonAnswerOutlined extends StatelessWidget {
  final String btnText;
  Function onPressed;

  ButtonAnswerOutlined({@required this.btnText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      width: BTN_WIDTH,
      height: BTN_HEIGHT + 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS / 2)),
        border: Border.all(
          color: BROWN_DARK,
        ),
      ),
      child: RaisedButton(
        elevation: 0.0,
        color: Colors.white,
        textColor: BROWN_DARK,
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
