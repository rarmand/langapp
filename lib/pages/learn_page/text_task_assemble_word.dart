import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_square.dart';
import 'package:langapp/components/button_outlined/button_letter.dart';
import 'package:langapp/components/frame/learning_frame.dart';
import 'package:langapp/components/input_field/input_one_letter_field.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/translation_word.dart';

class TextTaskAssembleWord extends StatelessWidget {
  final String courseTitle;
  // TODO: do naprawy ogólne działanie i sens zadania

  TextTaskAssembleWord({@required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return LearningFrame(
      courseTitle: this.courseTitle,
      child: Column(
        children: <Widget>[
          PointsLabel(points: 24500, iconPath: "assets/course/test.svg"),
          SizedBox(height: 64.0),
          TranslationWord(word: "słowo"), SizedBox(height: 12.0),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 4.0,
            children: <Widget>[
              // do naprawy, zablokowanie możliwości własnoręcznego wpisywania
              InputOneLetterField(),
              InputOneLetterField(),
              InputOneLetterField(),
              InputOneLetterField(),
              InputOneLetterField(),
              InputOneLetterField(),
              InputOneLetterField(),
              InputOneLetterField(),
              InputOneLetterField(),
              InputOneLetterField(),
            ],
          ),
          // TODO: jak rozstawić odpowiednie spaces pomiędzy elementami?
          SizedBox(height: MediaQuery.of(context).size.height / 7),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16.0,
            children: <Widget>[
              // TODO: mają zmieniać się losowo, zależnie od kliknięcia literki
              // przekaz z InkWell do Input
              // pytanie czy ten button pasuje
              ButtonLetter(character: "A"),
              ButtonLetter(character: "B"),
              ButtonLetter(character: "C"),
              ButtonLetter(character: "D"),
              ButtonLetter(character: "E"),
            ],
          ),
          SizedBox(height: 36.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonSquare(positive: false, onPressed: () {}),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
              ),
              ButtonSquare(positive: true, onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

/*
 */
