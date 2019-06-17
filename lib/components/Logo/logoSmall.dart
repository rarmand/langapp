import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoSmall extends StatelessWidget {
  final double topPadding;
  final Widget logo = SvgPicture.asset('assets/logo_small.svg');

  LogoSmall({this.topPadding = 30.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, this.topPadding, 0, this.topPadding - 15),
      child: logo,
    );
  }
}
