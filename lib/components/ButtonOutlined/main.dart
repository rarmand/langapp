import 'package:flutter/material.dart';

class ButtonOutlined extends StatelessWidget {
  final String btnText;

  ButtonOutlined({@required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: 250,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        border: Border.all(
          color: Color(0xFF6D4C41),
        ),
      ),
      child: RaisedButton(
        elevation: 0.0,
        color: Colors.transparent,
        textColor: Color(0xFF6D4C41),
        child: Text(
          this.btnText,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
