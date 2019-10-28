import 'dart:math';

import 'package:flutter/material.dart';
import 'package:langapp/components/button_outlined/button_answer_outlined.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/phonetic_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class TextTaskChooseWord extends StatefulWidget {
  final String wordKey;
  final Map word;
  final String skill;
  final Function(bool, String, String) onNext;

  TextTaskChooseWord({@required this.wordKey, @required this.word, @required this.skill, @required this.onNext});

  @override
  _TextTaskChooseWordState createState() => _TextTaskChooseWordState();
}

class _TextTaskChooseWordState extends State<TextTaskChooseWord> {
  List<String> _answersList = [];
  String _chosenAnswer;
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

  void _next(String chosenAnswer) async {
    if (this._chosenAnswer != null) return;
    setState(() {
      this._chosenAnswer = chosenAnswer;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (this.widget.word['translation'] == chosenAnswer) {
      this.widget.onNext(true, this.widget.wordKey, this.widget.skill);
    } else {
      this.widget.onNext(false, this.widget.wordKey, this.widget.skill);
    }
  }

  ButtonState getButtonState(String translation) {
    if (translation == this._chosenAnswer) {
      return translation == this.widget.word['translation'] ? ButtonState.CORRECT : ButtonState.INCORRECT;
    }
    if (this._chosenAnswer != null && translation == this.widget.word['translation']) {
      return ButtonState.CORRECT;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    List<ButtonAnswerOutlined> answers = [];

    this._answersList.forEach((translation) {
      answers.add(
        ButtonAnswerOutlined(
          btnText: translation,
          btnState: getButtonState(translation),
          onPressed: () => this._next(translation),
        ),
      );
    });

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(),
              const SizedBox(height: 16.0),
              LearningWord(word: this.widget.word['text'], audioUrl: this.widget.word['audio_url']),
              PhoneticWord(word: this.widget.word['phonetics']),
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
