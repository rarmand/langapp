import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:langapp/styles/colors.dart';

import 'menu_button.dart';

class MenuBottom extends StatelessWidget {
  final Widget home = SvgPicture.asset('assets/menu/home.svg');
  final Widget challenge = SvgPicture.asset('assets/menu/challenge.svg');
  final Widget profile = SvgPicture.asset('assets/menu/profile.svg');
  final Widget settings = SvgPicture.asset('assets/menu/settings.svg');

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MENU_HEIGHT,
        decoration: BoxDecoration(
          color: WHITE,
          boxShadow: [
            BoxShadow(
              color: BROWN_SHADOW_25,
              offset: Offset(0, -SHADOW_OFFSET),
              blurRadius: SHADOW_RADIUS,
            ),
          ],
        ),
        // TODO: czy sens trzymać to w gridzie?
        child: Row(
          children: <Widget>[
            MenuButton(icon: this.home, title: "Home"),
            MenuButton(icon: this.challenge, title: "Challenge"),
            MenuButton(icon: this.profile, title: "Profile"),
            MenuButton(icon: this.settings, title: "Settings"),
          ],
        ));
  }
}
