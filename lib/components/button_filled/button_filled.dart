import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:langapp/styles/colors.dart';

// idea of Flutter's raised button with gradient background
class ButtonFilled extends StatelessWidget {
  final String btnText;
  Function onPressed;

  ButtonFilled({@required this.btnText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: BTN_WIDTH,
      height: BTN_HEIGHT,
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
          ]),
      child: RaisedButton(
        elevation: 0.0,
        color: Colors.transparent,
        textColor: WHITE,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BTN_RADIUS),
        ),
        child: Text(
          this.btnText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
