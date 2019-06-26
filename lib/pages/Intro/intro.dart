import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/dots/dots.dart';
import 'package:langapp/components/intro_text/intro_text.dart';
import 'package:langapp/components/logo/logo_big.dart';

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
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: IntroText(text: "Test your abilities\nand\nlearn foreign languages!"),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Dots(chosen: 0),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
