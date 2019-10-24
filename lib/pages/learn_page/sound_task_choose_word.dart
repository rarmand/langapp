import 'dart:math';

import 'package:flutter/material.dart';
import 'package:langapp/components/button_outlined/button_answer_outlined.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/sound_button.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SoundTaskChooseWord extends StatefulWidget {
  final String wordKey;
  final Map word;
  final Function(bool, String) onNext;

  SoundTaskChooseWord({@required this.wordKey, @required this.word, @required this.onNext});

  @override
  _SoundTaskChooseWordState createState() => _SoundTaskChooseWordState();
}

class _SoundTaskChooseWordState extends State<SoundTaskChooseWord> {
  List<String> _answersList = [];
  final int _answersNumber = 4;

  @override
  void initState() {
    super.initState();
    this._setAnswers();
  }

  void _setAnswers() {
    this._answersList.add(this.widget.word['translation']);
    List allCourseWords = ScopedModel.of<UserModel>(context).chosenCourseWords.values.toList();

    while (this._answersList.length < this._answersNumber) {
      int rand = Random().nextInt(allCourseWords.length);

      if (!this._answersList.contains(allCourseWords[rand]['translation'])) {
        this._answersList.add(allCourseWords[rand]['translation']);
      }
    }

    this._answersList.shuffle();
  }

  void _next(String chosenAnswer) {
    if (this.widget.word['translation'] == chosenAnswer) {
      this.widget.onNext(true, this.widget.wordKey);
    } else {
      this.widget.onNext(false, this.widget.wordKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<ButtonAnswerOutlined> answers = [];

    this._answersList.forEach((translation) {
      answers.add(
        ButtonAnswerOutlined(
          btnText: translation,
          onPressed: () => this._next(translation),
        ),
      );
    });

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(),
              const SizedBox(height: 24.0),
              SoundButton(audioUrl: this.widget.word['audio_url']),
              const SizedBox(height: 40.0),
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
