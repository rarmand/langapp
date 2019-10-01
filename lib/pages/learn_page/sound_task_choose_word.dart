import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/components/button_outlined/button_answer_outlined.dart';
import 'package:langapp/components/learning_process/points_label.dart';

class SoundTaskChooseWord extends StatelessWidget {
  // TODO: if clicked, it needs to change a color
  // and add some shadow behind, if its not clicked
  final Widget soundIcon = SvgPicture.asset(
    "assets/learning/sound.svg",
    height: 100.0,
  );
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
              SizedBox(height: 64.0),
              this.soundIcon,
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
