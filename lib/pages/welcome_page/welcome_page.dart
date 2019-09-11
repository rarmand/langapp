import 'package:flutter/material.dart';
import 'package:langapp/components/button_outlined/button_outlined.dart';
import 'package:langapp/components/frame/welcome_frame.dart';
import 'package:langapp/components/intro_text/intro_text.dart';
import 'package:langapp/components/logo/welcome_icons.dart';

class WelcomePage extends StatelessWidget {
  final String _nextPath = "/choose_daily_goal";

  @override
  Widget build(BuildContext context) {
    // Stack ?
    return WelcomeFrame(
      bottomHeight: 25.0,
      logoWithArrow: false,
      onPressedNext: () => Navigator.pushNamed(context, this._nextPath),
      title: Text(
        "Welcome!",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      child: Column(
        children: <Widget>[
          WelcomeIcons(),
          IntroText(text: "For now, you can use every course\nyou are interested in."),
          IntroText(text: "We wish you have fun and learn\nyour favourite language in the best way\nyour brain says."),
          SizedBox(height: 28.0),
          ButtonOutlined(
            btnText: "Next",
            onPressed: () => Navigator.pushNamed(context, this._nextPath),
          ),
        ],
      ),
    );
  }
}
