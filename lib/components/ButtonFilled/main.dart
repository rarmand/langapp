import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:langapp/styles/colors.dart';

class ButtonFilled extends StatelessWidget {
  final String btnText;

  ButtonFilled({
    @required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnWidth,
      height: btnHeight,
      margin: EdgeInsets.all(btnMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(btnRadius)),
        gradient: LinearGradient(
          colors: <Color>[
            Color(GREEN_DARK),
            Color(GREEN_LIGHT),
          ],
        ),
      ),
      child: RaisedButton(
        elevation: 0.0,
        color: Colors.transparent,
        textColor: Color(WHITE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(btnRadius),
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
