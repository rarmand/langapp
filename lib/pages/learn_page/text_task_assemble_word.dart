import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/button_outlined/button_letter.dart';
import 'package:langapp/components/input_field/input_one_letter_field.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/translation_word.dart';

class TextTaskAssembleWord extends StatelessWidget {
  // TODO: do naprawy ogólne działanie i sens zadania

  final Map word;
  final Function(bool) onNext;

  TextTaskAssembleWord({Key key, @required this.word, @required this.onNext}) : super(key: key);

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
              const SizedBox(height: 48.0),
              TranslationWord(word: this.word['translation']),
              const SizedBox(height: 24.0),
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
              SizedBox(height: MediaQuery.of(context).size.height / 8),
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
              const SizedBox(height: 36.0),
              ButtonFilledBig(onPressed: () {}),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
