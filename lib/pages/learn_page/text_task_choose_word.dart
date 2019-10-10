import 'package:flutter/material.dart';
import 'package:langapp/components/button_outlined/button_answer_outlined.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/phonetic_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';

class TextTaskChooseWord extends StatelessWidget {
  final List<ButtonAnswerOutlined> answers = [
    ButtonAnswerOutlined(
      btnText: "Text number 1",
      onPressed: () {},
    ),
    ButtonAnswerOutlined(
      btnText: "Text number 2",
      onPressed: () {},
    ),
    ButtonAnswerOutlined(
      btnText: "Text number 3",
      onPressed: () {},
    ),
    ButtonAnswerOutlined(
      btnText: "Text number 4",
      onPressed: () {},
    )
  ];
  final Map word;
  final Function(bool) onNext;

  TextTaskChooseWord({Key key, @required this.word, @required this.onNext}) : super(key: key);

  void next() {
    // logika co sprawdza czy dobrze wykonane
    // i na koncu
    // onNext(false) jak zle zrobione lub onNext(true) jak dobrze
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(),
              const SizedBox(height: 16.0),
              LearningWord(word: this.word['text']),
              PhoneticWord(word: this.word['phonetics']),
              const SizedBox(height: 24.0),
              Column(
                children: this.answers,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
