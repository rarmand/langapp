import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/styles/colors.dart';

class LearningWord extends StatelessWidget {
  final Widget soundIcon = SvgPicture.asset("assets/learning/sound.svg");
  final String word;
  final bool isSoundIcon;

  LearningWord({@required this.word, this.isSoundIcon = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 32.0, bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          (this.isSoundIcon ? this.soundIcon : SizedBox()),
          Expanded(
            child: Container(
              padding: (this.isSoundIcon ? EdgeInsets.fromLTRB(12.0, 0, 32.0, 0) : null),
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
