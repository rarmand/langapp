import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeIcons extends StatelessWidget {
  final Widget icons = SvgPicture.asset('assets/intro/welcome.svg');
  final double padding = 15.0;
  WelcomeIcons();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: this.padding, bottom: this.padding),
      child: icons,
    );
  }
}
