import 'package:flutter/material.dart';
import 'package:langapp/components/button_outlined/button_answer_outlined.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/sound_button.dart';

class SoundTaskChooseWord extends StatelessWidget {
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

  SoundTaskChooseWord({Key key, @required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PointsLabel(points: 24500, iconPath: this.iconPath),
              const SizedBox(height: 40.0),
              SoundButton(),
              const SizedBox(height: 40.0),
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
