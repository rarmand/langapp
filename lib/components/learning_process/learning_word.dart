import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class LearningWord extends StatelessWidget {
  final Widget soundIcon = SvgPicture.asset("assets/learning/sound.svg");
  final String word;

  LearningWord({@required this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32.0, bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          this.soundIcon,
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(12.0, 0, 32.0, 0),
              child: Text(
                this.word,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: GREEN_LIGHT,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
