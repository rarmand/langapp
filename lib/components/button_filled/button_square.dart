import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class ButtonSquare extends StatelessWidget {
  final bool positive;
  Function onPressed;
  List<Color> _buttonGradient;
  IconData _buttonIcon;

  ButtonSquare({@required this.positive, @required this.onPressed}) {
    if (this.positive) {
      this._buttonGradient = [GREEN_DARK, GREEN_LIGHT];
      this._buttonIcon = Icons.check;
    } else {
      this._buttonGradient = [BROWN_LIGHT, BROWN_DARK];
      this._buttonIcon = Icons.clear;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.0,
      width: 72.0,
      margin: EdgeInsets.all(BTN_MARGIN * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
        gradient: LinearGradient(colors: this._buttonGradient),
        boxShadow: [
          BoxShadow(
            color: BROWN_SHADOW_25,
            offset: Offset(0, SHADOW_OFFSET / 4),
            blurRadius: BTN_RADIUS / 2,
          )
        ],
      ),
      child: RaisedButton(
        child: Icon(
          this._buttonIcon,
          size: 40.0,
          color: WHITE,
        ),
        elevation: 0.0,
        highlightColor: Colors.transparent,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BTN_RADIUS),
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}
