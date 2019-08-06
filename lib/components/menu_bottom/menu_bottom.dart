import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

import 'menu_button.dart';

class MenuBottom extends StatelessWidget {
  int chosen;
  final String homePath = 'assets/menu/home.svg';
  final String challengePath = 'assets/menu/challenge.svg';
  final String profilePath = 'assets/menu/profile.svg';
  final String settingsPath = 'assets/menu/settings.svg';

  // TODO: nie mam pojęcia jak zrobić wybieranie elementu z menu
  MenuBottom({@required this.chosen});

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

        // TODO: obmyślić jak podswietlić button w menu zależnie od TAP, który jest wewn widgetu
        child: Row(
          children: <Widget>[
            MenuButton(iconPath: this.homePath, title: "Home", route: "/", chosen: true),
            MenuButton(iconPath: this.challengePath, route: "/challenge", title: "Challenge"),
            MenuButton(iconPath: this.profilePath, route: "/profile", title: "Profile"),
            MenuButton(iconPath: this.settingsPath, route: "/settings", title: "Settings"),
          ],
        ));
  }
}
