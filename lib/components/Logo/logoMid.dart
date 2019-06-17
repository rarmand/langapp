import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:langapp/styles/colors.dart';

import 'main.dart';

class LogoMid extends StatelessWidget {
  final double topPadding;

  LogoMid({this.topPadding = 30.0});

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
            child: Transform.scale(
              scale: 0.8,
              child: LogoBig(topPadding: this.topPadding),
            ),
          ),
        ),
      ],
    );
  }
}
