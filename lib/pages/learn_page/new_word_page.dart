import 'package:carousel_slider/carousel_slider.dart';
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
  String _chosenHelpText = "";

  NewWordPage({@required this.wordKey, @required this.word, @required this.onNext});

  // ustala czy słowo ma być do uczenia czy do ignorowania
  // pojawia się na start każdego procesu uczenia słowa

  void _next(BuildContext context, bool isChosen) {
    if (!isChosen) {
      ScopedModel.of<UserModel>(context).ignoreWordToLearn(this.wordKey);
    } else {
      // dodac wybrany tekst pomocniczy do bazy uzytkownika
      if (this._chosenHelpText.length > 0 && this._chosenHelpText != this.word['help_text']) {
        print("Next with chosen help text");
        ScopedModel.of<UserModel>(context).setHelpText(wordkey: this.wordKey, helpText: this._chosenHelpText);
      }

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
    String helpText = ScopedModel.of<UserModel>(context, rebuildOnChange: true).getHelpText(wordkey: this.wordKey);
    List texts = ScopedModel.of<UserModel>(context, rebuildOnChange: true).getHelpTextList(wordkey: this.wordKey);

    final List<Widget> helpTexts = [];
    texts.forEach((text) {
      helpTexts.add(
        LearningHelpBox(
          wordkey: this.wordKey,
          helpText: text,
          index: texts.indexOf(text),
        ),
      );
    });
    helpTexts.add(
      LearningHelpBox(wordkey: this.wordKey, helpText: "", index: texts.length, toCreateText: true),
    );

    final index = texts.indexOf(helpText);
    final initialPageIndex = index > -1 ? index : 0;
    if (texts.length > 0) {
      this._chosenHelpText = texts[initialPageIndex];
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LearningWord(word: this.word['text'], audioUrl: this.word['audio_url']),
              PhoneticWord(word: this.word['phonetics']),
              TranslationWord(word: this.word['translation']),
              CarouselSlider(
                initialPage: initialPageIndex,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                height: 256.0,
                items: helpTexts,
                onPageChanged: (int index) {
                  if (index != texts.length)
                    this._chosenHelpText = texts[index];
                  else
                    this._chosenHelpText = "";
                },
              ),
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
