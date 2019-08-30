import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/frame/learning_frame.dart';
import 'package:langapp/components/learning_process/learning_label.dart';
import 'package:langapp/pages/intro_page/intro.dart';
import 'package:langapp/pages/intro_page/secintro.dart';
import 'package:langapp/pages/intro_page/trdintro.dart';
import 'package:langapp/pages/learn_page/learning_final_page.dart';
import 'package:langapp/pages/learn_page/new_word_page.dart';
import 'package:langapp/pages/learn_page/sound_task_choose_word.dart';
import 'package:langapp/pages/learn_page/sound_task_write_word.dart';
import 'package:langapp/pages/learn_page/text_task_assemble_word.dart';
import 'package:langapp/pages/learn_page/text_task_choose_sound.dart';
import 'package:langapp/pages/learn_page/text_task_choose_word.dart';
import 'package:langapp/pages/learn_page/text_task_speak_word.dart';
import 'package:langapp/pages/learn_page/text_task_write_word.dart';

// TODO: do poprawienia przekazywanie informacji o tytule
class LearnPageController extends StatefulWidget {
  final String courseTitle;

  LearnPageController({@required this.courseTitle});

  @override
  _LearnPageControllerState createState() => _LearnPageControllerState(courseTitle: this.courseTitle);
}

class _LearnPageControllerState extends State<LearnPageController> {
  final List<Widget> pages = [
    TextTaskChooseSound(
      key: PageStorageKey("TextTaskChooseSound"),
      iconPath: "assets/course/test.svg",
    ),
    TextTaskSpeakWord(
      key: PageStorageKey("TextTaskSpeakWord"),
      iconPath: "assets/course/test.svg",
    ),
    TextTaskAssembleWord(
      key: PageStorageKey("TextTaskAssembleWord"),
      iconPath: "assets/course/test.svg",
    ),
    SoundTaskWriteWord(
      key: PageStorageKey("SoundTaskWriteWord"),
      iconPath: "assets/course/test.svg",
    ),
    TextTaskWriteWord(
      key: PageStorageKey("TextTaskWriteWord"),
      iconPath: "assets/course/test.svg",
    ),
    LearningFinalPage(
      key: PageStorageKey("LearningFinalPage"),
      iconPath: "assets/course/test.svg",
    ),
    TextTaskChooseWord(
      key: PageStorageKey("TextTaskChooseWord"),
      iconPath: "assets/course/test.svg",
    ),
    SoundTaskChooseWord(
      key: PageStorageKey("SoundTaskChooseWord"),
      iconPath: "assets/course/test.svg",
    ),
    NewWordPage(
      key: PageStorageKey("NewWordPage"),
    ),
  ];

  int _selectedIndex = 0;
  final String courseTitle;

  _LearnPageControllerState({@required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUpper(
        title: this.courseTitle,
        isCourseAppBar: true,
        onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
        onClosePressed: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            children: this.pages,
            onPageChanged: (int index) => setState(() => this._selectedIndex = index),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: LearningLabel(point: 5),
          ),
        ],
      ),
    );
  }
}
