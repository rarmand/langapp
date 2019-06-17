import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class Arrow extends StatelessWidget {
  final Widget child;

  Arrow({this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(10, 50, 0, 0),
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(BROWN_DARK),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 30),
            child: this.child,
          ),
        ),
      ],
    );
  }
}
