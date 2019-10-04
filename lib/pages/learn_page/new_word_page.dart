import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/components/button_filled/button_square.dart';
import 'package:langapp/components/learning_process/image_box.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/phonetic_word.dart';
import 'package:langapp/components/learning_process/translation_word.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class NewWordPage extends StatelessWidget {
  final Widget _soundIcon = SvgPicture.asset("assets/learning/sound.svg");
  static int index = 0;

  NewWordPage({Key key}) : super(key: key);

// TODO: do naprawienia
// kolejnosć słow się nie zgadza i przejście do kolejnego kursu tworzy problemy
// page powinien dostawać słowo i wyświetlać - tyle. Żadnych operacji tutaj
  Map _getWord(BuildContext context) {
    List words = ScopedModel.of<UserModel>(context, rebuildOnChange: true).wordsToLearn.values.toList();
    Map word = words[index];

    if (index + 1 >= ScopedModel.of<UserModel>(context, rebuildOnChange: true).wordsToLearn.length)
      index = 0;
    else
      index += 1;

    print(word);
    print(index);

    return word;
  }

  @override
  Widget build(BuildContext context) {
    Map word = this._getWord(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LearningWord(word: word['text']),
              PhoneticWord(word: word['phonetics']),
              TranslationWord(word: word['translation']),
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
