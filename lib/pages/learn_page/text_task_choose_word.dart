import 'package:flutter/material.dart';
import 'package:langapp/components/button_outlined/button_answer_outlined.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/phonetic_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';

class TextTaskChooseWord extends StatelessWidget {
  final Map word;
  final Function(bool) onNext;

  TextTaskChooseWord({Key key, @required this.word, @required this.onNext}) : super(key: key);

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
    List<ButtonAnswerOutlined> answers = [
      ButtonAnswerOutlined(
        btnText: this.word['translation'],
        onPressed: () => this._next(false),
      ),
      ButtonAnswerOutlined(
        btnText: this.word['translation'],
        onPressed: () => this._next(true),
      ),
      ButtonAnswerOutlined(
        btnText: this.word['translation'],
        onPressed: () => this._next(false),
      ),
      ButtonAnswerOutlined(
        btnText: this.word['translation'],
        onPressed: () => this._next(false),
      )
    ];

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(),
              const SizedBox(height: 16.0),
              LearningWord(word: this.word['text'], audioUrl: this.word['audio_url']),
              PhoneticWord(word: this.word['phonetics']),
              const SizedBox(height: 24.0),
              Column(
                children: answers,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
