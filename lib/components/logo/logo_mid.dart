import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoMid extends StatelessWidget {
  final double topPadding;
  final Widget logo = SvgPicture.asset('assets/logo_mid.svg');

  LogoMid({this.topPadding = 30.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.0),
      child: logo,
    );
  }
}
