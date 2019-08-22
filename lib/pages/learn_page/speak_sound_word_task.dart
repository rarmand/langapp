import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/components/button_filled/button_filled_big.dart';
import 'package:langapp/components/frame/learning_frame.dart';
import 'package:langapp/components/learning_process/learning_word.dart';
import 'package:langapp/components/learning_process/points_label.dart';
import 'package:langapp/components/learning_process/translation_word.dart';
import 'package:langapp/styles/colors.dart';

class SpeakSoundWordTask extends StatelessWidget {
  final String courseTitle;

  // TODO: if clicked, it needs to change a color
  // and add some shadow behind, if its not clicked
  final Widget microphoneIcon = SvgPicture.asset(
    "assets/learning/microphone.svg",
    color: BROWN_DARK,
    height: 100.0,
  );

  SpeakSoundWordTask({@required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return LearningFrame(
      courseTitle: "My course Title",
      child: Column(
        children: <Widget>[
          PointsLabel(points: 24500, iconPath: "assets/course/test.svg"),
          SizedBox(height: 40.0),
          LearningWord(word: "słowo"),
          SizedBox(
            height: 32.0,
          ),
          Text(
            "Tap the microphone icon and record your speaking of the word.",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32.0),
          // Inkwell ? klikalne ? jako ikonka nagrywania
          InkWell(child: this.microphoneIcon, onTap: () => print("hey")),
          SizedBox(height: 72.0),
          // to raczej do stacka
          ButtonFilledBig(onPressed: () {}),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
