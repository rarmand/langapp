import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:langapp/styles/colors.dart';

// idea of Flutter's raised button with gradient background
class ButtonFilled extends StatelessWidget {
  final String btnText;

  ButtonFilled({
    @required this.btnText,
  });

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
      ),
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
