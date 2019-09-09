import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class Arrow extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  Arrow({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.arrow_back_ios,
              color: BROWN_DARK,
            ),
            onPressed: this.onPressed,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 50),
            child: this.child,
          ),
        ),
      ],
    );
  }
}
