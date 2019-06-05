import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/Dots/main.dart';
import 'package:langapp/components/IntroText/main.dart';
import 'package:langapp/components/Logo/main.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              LogoBig(),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  // TODO: czy można inaczej tworzyć padding ??
                  padding: EdgeInsets.only(top: 50),
                  child: IntroText(text: "Test your abilities\nand\nlearn foreign languages!"),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Dots(0),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
