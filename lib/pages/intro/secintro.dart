import 'package:flutter/material.dart';
import 'package:langapp/components/dots/dots.dart';
import 'package:langapp/components/intro_text/intro_text.dart';
import 'package:langapp/components/logo/logo_big.dart';

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
