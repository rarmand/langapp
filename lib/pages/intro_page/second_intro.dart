import 'package:flutter/material.dart';
import 'package:langapp/components/frame/intro_frame.dart';
import 'package:langapp/components/intro_text/intro_text.dart';

class SecondIntro extends StatelessWidget {
  SecondIntro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroFrame(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IntroText(text: "Our application will help you\nto diagnose your skills:"),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: "listening, reading,\nspeaking ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "and",
                ),
                TextSpan(
                  text: " writing.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IntroText(text: "This will give you the best recipe for\nfuture learning process."),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
