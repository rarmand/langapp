import 'package:flutter/material.dart';
import 'package:langapp/components/IntroText/main.dart';
import 'package:langapp/components/Logo/welcomeIcons.dart';
import 'package:langapp/components/WelcomeFrame.dart/main.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WelcomeFrame(
      title: "Welcome!",
      child: Column(
        children: <Widget>[
          WelcomeIcons(),
          IntroText(text: "For now, you can use every course\nyou are interested at."),
          IntroText(text: "We wish you have fun and learn\nyour favourite language in the best way\nyour brain says."),
          const SizedBox(height: 25.0),
        ],
      ),
    );
  }
}
