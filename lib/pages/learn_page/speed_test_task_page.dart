import 'dart:math';

import 'package:flutter/material.dart';
import 'package:langapp/components/button_outlined/button_answer_outlined.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/phonetic_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class SpeedTestTask extends StatefulWidget {
  final String wordKey;
  final Map word;
  final Function(bool) onNext;

  SpeedTestTask({@required this.wordKey, @required this.word, @required this.onNext});

  @override
  _SpeedTestTaskState createState() => _SpeedTestTaskState();
}

class _SpeedTestTaskState extends State<SpeedTestTask> with SingleTickerProviderStateMixin {
  List<String> _answersList = [];
  String _chosenAnswer;
  final int _answersNumber = 4;

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    this._setAnswers();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        this.widget.onNext(false);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
    this.controller.stop();
    if (this._chosenAnswer != null) return;
    setState(() {
      this._chosenAnswer = chosenAnswer;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (this.widget.word['translation'] == chosenAnswer) {
      this.widget.onNext(true);
    } else {
      this.widget.onNext(false);
    }
  }

  ButtonOutlinedState getButtonState(String translation) {
    if (translation == this._chosenAnswer) {
      return translation == this.widget.word['translation']
          ? ButtonOutlinedState.CORRECT
          : ButtonOutlinedState.INCORRECT;
    }
    if (this._chosenAnswer != null && translation == this.widget.word['translation']) {
      return ButtonOutlinedState.CORRECT;
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
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Container(
                    color: YELLOW.withOpacity(min(0.2 + controller.value, 1)),
                    height:
                        MediaQuery.of(context).size.height - (controller.value * MediaQuery.of(context).size.height),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  PointsLabel(isSpeedTest: true),
                  const SizedBox(height: 16.0),
                  LearningWord(word: this.widget.word['text'], isSoundIcon: false, audioUrl: ''),
                  PhoneticWord(word: this.widget.word['phonetics']),
                  const SizedBox(height: 24.0),
                  Column(
                    children: answers,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
