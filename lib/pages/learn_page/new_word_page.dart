import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_square.dart';
import 'package:langapp/components/learning_process/learning_help_box.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/phonetic_word.dart';
import 'package:langapp/components/learning_process/translation_word.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class NewWordPage extends StatelessWidget {
  final String wordKey;
  final Map<dynamic, dynamic> word; // {"text": '', "translation": '', ...}
  final Function(bool, String) onNext;

  NewWordPage({@required this.wordKey, @required this.word, @required this.onNext});

  // ustala czy słowo ma być do uczenia czy do ignorowania
  // pojawia się na start każdego procesu uczenia słowa

  void _next(BuildContext context, bool isChosen) {
    if (!isChosen) {
      ScopedModel.of<UserModel>(context).ignoreWordToLearn(this.wordKey);
    } else {
      this.onNext(false, this.wordKey);
    }
  }

  // tutaj określić obrazek lub tekst wspomagający
  //
  // strona ma się pojawiać jeśli user popełni błąd
  // ma być wyświetlony tekst , fonetyka, tłumaczenie i element wspomagający
  // trzeba nadać możliwość zmiany obrazka, gdzieś z boku
  //
  // strona ma się pojawiać po kliku na słówko w TheoryPage
  // bez appbaru

  // czy dodać tu mic z wymową usera w kolejnym procesie uczenia?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LearningWord(word: this.word['text'], audioUrl: this.word['audio_url']),
              PhoneticWord(word: this.word['phonetics']),
              TranslationWord(word: this.word['translation']),
              LearningHelpBox(wordkey: this.wordKey, word: word),
              // button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonSquare(positive: false, onPressed: () => this._next(context, false)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  ButtonSquare(positive: true, onPressed: () => this._next(context, true)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
