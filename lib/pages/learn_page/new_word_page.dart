import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/components/button_filled/button_square.dart';
import 'package:langapp/components/learning_process/image_box.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/phonetic_word.dart';
import 'package:langapp/components/learning_process/translation_word.dart';

class NewWordPage extends StatelessWidget {
  final Widget _soundIcon = SvgPicture.asset("assets/learning/sound.svg");
  static int index = 0;
  Map word;

  final Function(bool) onNext;

  NewWordPage({Key key, @required this.word, @required this.onNext}) : super(key: key);

  void next() {
    // logika co sprawdza czy dobrze wykonane
    // i na koncu
    // onNext(false) jak zle zrobione lub onNext(true) jak dobrze
  }

  @override
  Widget build(BuildContext context) {
    print(word);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LearningWord(word: this.word['text']),
              PhoneticWord(word: this.word['phonetics']),
              TranslationWord(word: this.word['translation']),
              ImageBox(),
              // button
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
        ),
      ),
    );
  }
}
