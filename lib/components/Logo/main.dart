import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoBig extends StatelessWidget {
  final double topPadding;
  final Widget logo = Column(
    children: <Widget>[
      SvgPicture.asset('assets/logo.svg'),
      SvgPicture.asset('assets/logo_text.svg'),
    ],
  );

  LogoBig({this.topPadding = 80.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, this.topPadding, 0, 0),
      child: logo,
    );
  }
}
