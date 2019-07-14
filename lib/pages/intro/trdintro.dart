import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/button_outlined/button_outlined.dart';
import 'package:langapp/pages/intro/intro_frame.dart';
import 'package:langapp/styles/colors.dart';

class TrdIntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double marginValue = 30.0;

    return IntroFrame(
      child: Column(
        children: <Widget>[
          const SizedBox(height: marginValue),
          ButtonFilled(
            btnText: "Sign up",
          ),
          ButtonOutlined(btnText: "I have an account"),
          Container(
            margin: EdgeInsets.fromLTRB(0, marginValue, 0, marginValue),
            child: Text(
              "Try the app for free!",
              style: TextStyle(
                color: BROWN_DARK,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
