import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class ButtonOutlined extends StatelessWidget {
  final String btnText;

  ButtonOutlined({
    @required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: btnWidth,
      height: btnHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(btnRadius)),
        border: Border.all(
          color: Color(BROWN_DARK),
        ),
      ),
      child: RaisedButton(
        elevation: 0.0,
        color: Colors.transparent,
        textColor: Color(BROWN_DARK),
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
