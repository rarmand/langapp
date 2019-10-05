import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/sound_button.dart';

class TextTaskChooseSound extends StatelessWidget {
  final String iconPath;

  TextTaskChooseSound({Key key, @required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(points: 24500, iconPath: this.iconPath),
              const SizedBox(height: 40.0),
              LearningWord(word: "the word", isSoundIcon: false),
              const SizedBox(height: 32.0),
              Text("Choose a right sound answer."),
              const SizedBox(height: 64.0),
              Wrap(
                spacing: 32.0,
                children: <Widget>[
                  SoundButton(height: 56),
                  SoundButton(height: 56),
                  SoundButton(height: 56),
                ],
              ),
              const SizedBox(height: 72.0),
              // TODO: naprawić wygląd strony
              ButtonFilledBig(onPressed: () {}),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
