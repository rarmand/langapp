import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/phonetic_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';

class TextTaskWriteWord extends StatelessWidget {
  final Map word;
  final Function(bool) onNext;

  TextTaskWriteWord({Key key, @required this.word, @required this.onNext}) : super(key: key);

  void _next(bool goodAnswer) {
    // logika co sprawdza czy dobrze wykonane
    // i na koncu
    // onNext(false) jak zle zrobione lub onNext(true) jak dobrze
    if (!goodAnswer) {
      this.onNext(false);
    } else {
      this.onNext(true);
    }
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
              const SizedBox(height: 18.0),
              LearningWord(
                word: this.word['text'],
                audioUrl: this.word['audio_url'],
              ),
              PhoneticWord(word: this.word['phonetics']),
              const SizedBox(height: 64.0),
              InputField(label: "Write the translation"),
              SizedBox(height: MediaQuery.of(context).size.height / 6),
              ButtonFilledBig(onPressed: () => this._next(false)),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
