import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class ButtonFilledBig extends StatelessWidget {
  final String btnText;
  Function onPressed;

  ButtonFilledBig({this.btnText = "Accept", this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: BTN_WIDTH,
      height: BTN_HEIGHT * 1.8,
      margin: EdgeInsets.all(BTN_MARGIN),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
        gradient: LinearGradient(
          colors: <Color>[
            GREEN_DARK,
            GREEN_LIGHT,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: BROWN_SHADOW_25,
            offset: Offset(0, SHADOW_OFFSET / 4),
            blurRadius: BTN_RADIUS / 2,
          )
        ],
      ),
      child: RaisedButton(
        elevation: 0.0,
        highlightColor: Colors.transparent,
        color: Colors.transparent,
        textColor: WHITE,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BTN_RADIUS),
        ),
        child: Text(
          this.btnText,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}
