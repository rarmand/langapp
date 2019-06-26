import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

// idea of Flutter's raised button with transparent background
class ButtonOutlined extends StatelessWidget {
  final String btnText;

  ButtonOutlined({
    @required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: BTN_WIDTH,
      height: BTN_HEIGHT,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
        border: Border.all(
          color: BROWN_DARK,
        ),
      ),
      child: RaisedButton(
        elevation: 0.0,
        color: Colors.transparent,
        textColor: BROWN_DARK,
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
