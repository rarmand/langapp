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
  Map _word = {
    'text': '',
    'translation': '',
    'phonetics': '',
  };

  NewWordPage({Key key}) : super(key: key);

  void setWord(Map word) {
    this._word = word;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LearningWord(word: this._word['text']),
              PhoneticWord(word: this._word['phonetics']),
              TranslationWord(word: this._word['translation']),
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

// class NewWordPag extends StatelessWidget {
//   NewWordPag({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         LearningWord(word: "the word"),
//         PhoneticWord(word: "/my mankhiohihio/"),
//         TranslationWord(word: "tłumaczenie tego bardzo długiego słowa"),
//         ImageBox(),
//         // button
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ButtonSquare(positive: false, onPressed: () {}),
//             SizedBox(
//               width: MediaQuery.of(context).size.width / 4,
//             ),
//             ButtonSquare(positive: true, onPressed: () {}),
//           ],
//         ),
//       ],
//     );
//   }
// }
