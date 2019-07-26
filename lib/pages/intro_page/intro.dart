import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/frame/intro_frame.dart';
import 'package:langapp/components/intro_text/intro_text.dart';

// TODO: intro ze swapowaniem 3x z różnym contentem
class IntroPage extends StatelessWidget {
  IntroPage({Key key}) : super(key: key);
  
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
