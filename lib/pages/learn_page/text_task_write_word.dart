import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_square.dart';
import 'package:langapp/components/frame/learning_frame.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/phonetic_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';

class TextTaskWriteWord extends StatelessWidget {
  final String courseTitle;

  TextTaskWriteWord({@required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return LearningFrame(
      courseTitle: "Course Title",
      child: Column(
        children: <Widget>[
          PointsLabel(points: 24500, iconPath: "assets/course/add.svg"),
          SizedBox(height: 40.0),
          LearningWord(word: "the word"),
          PhoneticWord(word: "/my mankhiohihio/"),
          SizedBox(height: 64.0),
          InputField(
            title: "Write the translation",
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 6),
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
