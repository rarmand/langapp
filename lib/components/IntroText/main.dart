import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  final String text;

  IntroText({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
      child: Text(
        this.text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.0,
          color: Color.fromRGBO(109, 76, 65, 1),
        ),
      ),
    );
  }
}
