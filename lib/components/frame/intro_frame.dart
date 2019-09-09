import 'package:flutter/material.dart';
import 'package:langapp/components/frame/frame.dart';
import 'package:langapp/components/logo/logo_big.dart';

class IntroFrame extends StatelessWidget {
  Widget child;

  IntroFrame({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Frame(
      child: Column(
        children: <Widget>[
          LogoBig(),
          this.child,
        ],
      ),
    );
  }
}
