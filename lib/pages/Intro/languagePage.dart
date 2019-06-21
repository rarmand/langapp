import 'package:flutter/material.dart';
import 'package:langapp/components/WelcomeCard/main.dart';
import 'package:langapp/components/WelcomeFrame.dart/main.dart';
import 'package:langapp/styles/colors.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WelcomeFrame(
      // TODO: do wycięcia ?
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: "Choose ",
              style: TextStyle(
                color: Color(BROWN_DARK),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            TextSpan(
              text: "language\n",
              style: TextStyle(
                color: Color(GREEN_LIGHT),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            TextSpan(
              text: "you want to learn",
              style: TextStyle(
                color: Color(BROWN_DARK),
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              WelcomeCard(
                title: "Language",
                img: SizedBox(height: 100),
              ),
              WelcomeCard(
                title: "Language",
                img: SizedBox(
                  height: 100,
                ),
              ),
              WelcomeCard(
                title: "Language",
                img: SizedBox(height: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
