import 'package:flutter/material.dart';
import 'package:langapp/components/Dots/main.dart';
import 'package:langapp/components/IntroText/main.dart';
import 'package:langapp/components/Logo/logoBig.dart';

class SecIntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              LogoBig(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // TODO: czy tyle tekstu na pewno?
                    IntroText(text: "Our application will help you\nto diagnose your skills:"),
                    IntroText(text: "listening, reading,\nspeaking and writing."),
                    IntroText(text: "This will give you the best recipe for\nfuture learning process."),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Dots(chosen: 1),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
