import 'package:flutter/material.dart';
import 'package:langapp/components/button_outlined/button_answer_outlined.dart';
import 'package:langapp/components/frame/learning_frame.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/phonetic_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';

class ChooseTranslationTask extends StatelessWidget {
  final String courseTitle;

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

  ChooseTranslationTask({@required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return LearningFrame(
      courseTitle: "Course Title",
      child: Column(
        children: <Widget>[
          PointsLabel(points: 24500, iconPath: "assets/course/test.svg"),
          SizedBox(height: 40.0),
          LearningWord(word: "the word"),
          PhoneticWord(word: "/my mankhiohihio/"),
          SizedBox(height: 48.0),
          Column(
            children: this.answers,
          ),
        ],
      ),
    );
  }
}
