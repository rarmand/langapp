import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/frame/learning_frame.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/loudspeaker_word_button.dart';
import 'package:langapp/components/learning_process/points_label.dart';

class TextTaskChooseSound extends StatelessWidget {
  final String iconPath;

  TextTaskChooseSound({Key key, @required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LearningFrame(
      child: Column(
        children: <Widget>[
          PointsLabel(points: 24500, iconPath: this.iconPath),
          SizedBox(height: 40.0),
          LearningWord(word: "the word", isSoundIcon: false),
          SizedBox(height: 32.0),
          Text("Choose a right sound answer."),
          SizedBox(height: 64.0),
          Wrap(
            spacing: 32.0,
            children: <Widget>[
              LoudspeakerWordButton(news: "Sound 1"),
              LoudspeakerWordButton(news: "Sound 2"),
              LoudspeakerWordButton(news: "Sound 3"),
            ],
          ),
          SizedBox(height: 72.0),
          // TODO: naprawić wygląd strony
          ButtonFilledBig(onPressed: () {}),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
