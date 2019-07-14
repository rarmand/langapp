import 'package:flutter/material.dart';
import 'package:langapp/components/dots/dots.dart';
import 'package:langapp/components/logo/logo_big.dart';

class IntroFrame extends StatelessWidget {
  Widget child;

  IntroFrame({@required this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: stack dla kropek
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            LogoBig(),
            Expanded(
              child: this.child,
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 30),
              child: Dots(chosen: 1),
            ),
          ],
        ),
      ),
    );
  }
}
