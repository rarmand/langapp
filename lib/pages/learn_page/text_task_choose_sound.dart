import 'dart:math';

import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/sound_button.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class TextTaskChooseSound extends StatefulWidget {
  final String wordKey;
  final Map word;
  final String skill;
  final Function(bool, String, String) onNext;

  TextTaskChooseSound({@required this.wordKey, @required this.word, @required this.skill, @required this.onNext});

  @override
  _TextTaskChooseSoundState createState() => _TextTaskChooseSoundState();
}

class _TextTaskChooseSoundState extends State<TextTaskChooseSound> {
  List<String> _answersUrlList = [];
  String _chosenAudioUrlAnswer = "";
  bool _acceptedChosenAnswer = false;
  final int _answersNumber = 3;

  @override
  void initState() {
    super.initState();
    this._setAnswers();
  }

  void _setAnswers() {
    this._answersUrlList.add(this.widget.word['audio_url']);
    List allCourseWords = ScopedModel.of<UserModel>(context).chosenCourseWords.values.toList();

    while (this._answersUrlList.length < this._answersNumber) {
      int rand = Random().nextInt(allCourseWords.length);
      if (!this._answersUrlList.contains(allCourseWords[rand]['audio_url'])) {
        print(allCourseWords[rand]['audio_url']);
        this._answersUrlList.add(allCourseWords[rand]['audio_url']);
      }
    }

    this._answersUrlList.shuffle();
  }

  void _next() async {
    if (this._chosenAudioUrlAnswer.isEmpty) return;
    setState(() {
      _acceptedChosenAnswer = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (this._chosenAudioUrlAnswer == this.widget.word['audio_url']) {
      this.widget.onNext(true, this.widget.wordKey, this.widget.skill);
    } else {
      this.widget.onNext(false, this.widget.wordKey, this.widget.skill);
    }
  }

  void _onChooseSoundTap(String audioUrl) {
    setState(() => this._chosenAudioUrlAnswer = audioUrl);
  }

  SoundButtonState getButtonState(String audioUrl) {
    if (audioUrl == this._chosenAudioUrlAnswer) {
      if (this._acceptedChosenAnswer) {
        return audioUrl == this.widget.word['audio_url'] ? SoundButtonState.CORRECT : SoundButtonState.INCORRECT;
      } else {
        return SoundButtonState.CHOSEN;
      }
    }
    if (this._acceptedChosenAnswer && audioUrl == this.widget.word['audio_url']) {
      return SoundButtonState.CORRECT;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    print("anything");

    List<SoundButton> soundAnswersList = [];
    this._answersUrlList.forEach((audioUrl) {
      soundAnswersList.add(
        SoundButton(
          height: 56,
          audioUrl: audioUrl,
          btnState: getButtonState(audioUrl),
          onChooseSoundTap: this._onChooseSoundTap,
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
              LearningWord(
                word: this.widget.word['translation'],
                isSoundIcon: false,
                audioUrl: '',
              ),
              const SizedBox(height: 48.0),
              Text("Choose a correct sound answer."),
              const SizedBox(height: 80.0),
              Wrap(
                spacing: 32.0,
                children: soundAnswersList,
              ),
              const SizedBox(height: 64.0),
              ButtonFilledBig(onPressed: this._next),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
