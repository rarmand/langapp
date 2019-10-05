import 'package:flutter/material.dart';
import 'package:langapp/components/learning_process/sound_button.dart';
import 'package:langapp/styles/colors.dart';

class LearningWord extends StatelessWidget {
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
          (this.isSoundIcon ? SoundButton(height: 24) : SizedBox()),
          Expanded(
            child: Container(
              padding: (this.isSoundIcon ? EdgeInsets.only(top: 8.0, right: 40.0) : null),
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
