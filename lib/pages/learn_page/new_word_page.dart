import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/button_filled/button_square.dart';
import 'package:langapp/components/learning_process/image_box.dart';
import 'package:langapp/components/learning_process/learning_label.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/phonetic_word.dart';
import 'package:langapp/components/learning_process/translation_word.dart';
import 'package:langapp/styles/colors.dart';

class NewWordPage extends StatelessWidget {
  final String courseTitle;
  final Widget soundIcon = SvgPicture.asset("assets/learning/sound.svg");

  NewWordPage({@required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUpper(
        title: this.courseTitle,
        isCourseAppBar: true,
        onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
        onClosePressed: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LearningLabel(point: 4),
              Container(
                margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Column(
                  children: <Widget>[
                    LearningWord(word: "the word"),
                    PhoneticWord(word: "/my mankhiohihio/"),
                    TranslationWord(word: "tłumaczenie tego bardzo długiego słowa"),
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
            ],
          ),
        ),
      ),
    );
  }
}
