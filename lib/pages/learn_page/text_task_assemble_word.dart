import 'dart:math';

import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/button_outlined/button_letter.dart';
import 'package:langapp/components/input_field/input_one_letter_field.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/translation_word.dart';
import 'package:langapp/styles/colors.dart';

class TextTaskAssembleWord extends StatefulWidget {
  final String wordKey;
  final Map word;
  final String skill;
  final Function(bool, String, String) onNext;

  TextTaskAssembleWord({@required this.wordKey, @required this.word, @required this.skill, @required this.onNext});

  @override
  _TextTaskAssembleWordState createState() => _TextTaskAssembleWordState();
}

class _TextTaskAssembleWordState extends State<TextTaskAssembleWord> {
  int _index = 0;
  List<String> _expectedLetters = [];
  List<String> _clickedLetters = [];
  final int _buttonsNumber = 5;
  List<String> _letters = [];
  bool _isCorrectAnswer = null;

  @override
  void initState() {
    super.initState();

    String text = this.widget.word['text'];
    text = text.split(' ').join('');
    this._expectedLetters = text.split('');
    this._clickedLetters = List.filled(text.length, " ");

    this._letters = this._getRandomLetters(number: _buttonsNumber);
  }

  void _next() async {
    bool goodAnswer = true;
    for (int i = 0; i < this._expectedLetters.length; i++) {
      if (this._expectedLetters[i] != this._clickedLetters[i]) goodAnswer = false;
    }

    setState(() {
      this._isCorrectAnswer = goodAnswer;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (!goodAnswer) {
      this.widget.onNext(false, this.widget.wordKey, this.widget.skill);
    } else {
      this.widget.onNext(true, this.widget.wordKey, this.widget.skill);
    }
  }

  List<String> _getRandomLetters({@required int number}) {
    List<String> letters = [];
    letters.add(this._expectedLetters[this._index]);

    List<String> randomLetters = ['a', 'd', 'i', 'e', 'R'];

    while (letters.length < number) {
      int rand = Random().nextInt(this._expectedLetters.length);

      if (!letters.contains(this._expectedLetters[rand])) {
        letters.add(this._expectedLetters[rand]);
      } else {
        rand = Random().nextInt(randomLetters.length);
        letters.add(randomLetters[rand]);
      }
    }

    letters.shuffle();

    return letters;
  }

  void _onButtonLetterTap(String chosenLetter) {
    setState(() {
      this._clickedLetters[this._index] = chosenLetter;
      this._index += 1;
      if (this._index < this._clickedLetters.length) {
        this._letters = this._getRandomLetters(number: _buttonsNumber);
      }
    });
  }

  void _onBackspaceTap() {
    if (this._index > 0) {
      setState(() {
        this._index--;
        this._clickedLetters[this._index] = " ";
        this._letters = this._getRandomLetters(number: _buttonsNumber);
      });
    }
  }

  InputLetterState _getBtnState() {
    if (this._isCorrectAnswer != null) {
      if (this._isCorrectAnswer) {
        return InputLetterState.CORRECT;
      }
      return InputLetterState.INCORRECT;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // creating list of fields to fill by buttons
    List<Widget> listOfFields = [];

    this._clickedLetters.forEach((letter) {
      listOfFields.add(
        InputOneLetterField(
          chosenLetter: letter,
          btnState: this._getBtnState(),
        ),
      );
    });

    listOfFields.add(
      IconButton(
        icon: Icon(Icons.backspace, size: 22.0, color: BROWN_DARK),
        onPressed: this._onBackspaceTap,
      ),
    );

    // created list of buttons
    List<Widget> listOfButtons = [];
    this._letters.forEach((letter) {
      listOfButtons.add(
        ButtonLetter(
          character: letter,
          onTap: () => this._onButtonLetterTap(letter),
        ),
      );
    });

    bool isIncorrect = this._getBtnState() == InputLetterState.INCORRECT;

    // returned build of view
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(),
              const SizedBox(height: 48.0),
              TranslationWord(word: this.widget.word['translation']),
              const SizedBox(height: 24.0),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 4.0,
                children: listOfFields,
              ),
              (isIncorrect ? SizedBox(height: 16.0) : SizedBox(height: 0.0)),
              if (isIncorrect)
                Text(
                  this.widget.word['text'],
                  textAlign: TextAlign.left,
                  style: TextStyle(color: GREEN_DARK),
                ),
              SizedBox(height: isIncorrect ? 32.0 : 64.0),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12.0,
                children: listOfButtons,
              ),
              const SizedBox(height: 48.0),
              ButtonFilledBig(onPressed: this._next),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
