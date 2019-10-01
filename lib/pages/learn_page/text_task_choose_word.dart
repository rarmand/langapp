import 'package:flutter/material.dart';
import 'package:langapp/components/button_outlined/button_answer_outlined.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/phonetic_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';

class TextTaskChooseWord extends StatelessWidget {
  final List<ButtonAnswerOutlined> answers = [
    ButtonAnswerOutlined(
      btnText: "Text number 1",
      onPressed: () {},
    ),
    ButtonAnswerOutlined(
      btnText: "Text number 2",
      onPressed: () {},
    ),
    ButtonAnswerOutlined(
      btnText: "Text number 3",
      onPressed: () {},
    ),
    ButtonAnswerOutlined(
      btnText: "Text number 4",
      onPressed: () {},
    )
  ];

  final String iconPath;

  TextTaskChooseWord({Key key, @required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(points: 24500, iconPath: this.iconPath),
              SizedBox(height: 40.0),
              LearningWord(word: "the word"),
              PhoneticWord(word: "/my mankhiohihio/"),
              SizedBox(height: 48.0),
              Column(
                children: this.answers,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
