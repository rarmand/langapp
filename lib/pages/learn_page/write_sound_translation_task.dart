import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/components/button_filled/button_square.dart';
import 'package:langapp/components/frame/learning_frame.dart';
import 'package:langapp/components/input_field/input_field.dart';
import 'package:langapp/components/learning_process/points_label.dart';

class WriteSoundTranslationTask extends StatelessWidget {
  final String courseTitle;
  // TODO: if clicked, it needs to change a color
  // and add some shadow behind, if its not clicked
  final Widget soundIcon = SvgPicture.asset(
    "assets/learning/sound.svg",
    height: 100.0,
  );

  WriteSoundTranslationTask({@required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return LearningFrame(
      courseTitle: "Course Title",
      child: Column(
        children: <Widget>[
          PointsLabel(points: 24500, iconPath: "assets/course/all_vocab.svg"),
          SizedBox(height: 64.0),
          this.soundIcon,
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
