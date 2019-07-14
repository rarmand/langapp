import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/intro_text/intro_text.dart';
import 'intro_frame.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroFrame(
      child: Container(
        padding: EdgeInsets.only(top: 50),
        child: IntroText(text: "Test your abilities\nand\nlearn foreign languages!"),
      ),
    );
  }
}
