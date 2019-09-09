import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/button_outlined/button_outlined.dart';
import 'package:langapp/components/frame/intro_frame.dart';
import 'package:langapp/styles/colors.dart';

class ThirdIntro extends StatelessWidget {
  ThirdIntro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double marginValue = 30.0;

    return IntroFrame(
      child: Column(
        children: <Widget>[
          const SizedBox(height: marginValue),
          ButtonFilled(
            btnText: "Sign up",
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false);
              Navigator.pushNamed(context, '/register');
            },
          ),
          ButtonOutlined(
            btnText: "I have an account",
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false),
          ),
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
