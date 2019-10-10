import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/sound_button.dart';

class TextTaskChooseSound extends StatelessWidget {
  final Map word;
  final Function(bool) onNext;

  TextTaskChooseSound({Key key, @required this.word, @required this.onNext}) : super(key: key);

  void next() {
    // logika co sprawdza czy dobrze wykonane
    // i na koncu
    // onNext(false) jak zle zrobione lub onNext(true) jak dobrze
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(),
              const SizedBox(height: 24.0),
              LearningWord(word: this.word['text'], isSoundIcon: false),
              const SizedBox(height: 48.0),
              Text("Choose a right sound answer."),
              const SizedBox(height: 80.0),
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
