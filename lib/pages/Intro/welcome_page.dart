import 'package:flutter/material.dart';
import 'package:langapp/components/intro_text/intro_text.dart';
import 'package:langapp/components/logo/welcome_icons.dart';
import 'package:langapp/components/welcome_frame/welcome_frame.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WelcomeFrame(
      bottomHeight: 25.0,
      logoWithArrow: false,
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
          IntroText(text: "For now, you can use every course\nyou are interested at."),
          IntroText(text: "We wish you have fun and learn\nyour favourite language in the best way\nyour brain says."),
        ],
      ),
    );
  }
}
