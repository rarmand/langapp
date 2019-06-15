import 'package:flutter/material.dart';

class ButtonFilled extends StatelessWidget {
  final String btnText;

  ButtonFilled({@required this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF18AB00),
            Color(0xFF38D900),
          ],
        ),
      ),
      child: RaisedButton(
        elevation: 0.0,
        color: Colors.transparent,
        textColor: Colors.white,
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
