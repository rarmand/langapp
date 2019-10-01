import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
import 'package:langapp/components/learning_process/learning_label.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/pages/learn_page/learning_final_page.dart';
import 'package:langapp/pages/learn_page/new_word_page.dart';
import 'package:langapp/pages/learn_page/sound_task_choose_word.dart';
import 'package:langapp/pages/learn_page/sound_task_write_word.dart';
import 'package:langapp/pages/learn_page/text_task_assemble_word.dart';
import 'package:langapp/pages/learn_page/text_task_choose_sound.dart';
import 'package:langapp/pages/learn_page/text_task_choose_word.dart';
import 'package:langapp/pages/learn_page/text_task_speak_word.dart';
import 'package:langapp/pages/learn_page/text_task_write_word.dart';
import 'package:scoped_model/scoped_model.dart';

// TODO: do poprawienia przekazywanie informacji o tytule
class LearnPageController extends StatefulWidget {
  @override
  _LearnPageControllerState createState() => _LearnPageControllerState();
}

class _LearnPageControllerState extends State<LearnPageController> {
  final List<Widget> _reading = [
    TextTaskAssembleWord(
      key: PageStorageKey("TextTaskAssembleWord"),
      iconPath: "assets/course/test.svg",
    ),
    TextTaskChooseWord(
      key: PageStorageKey("TextTaskChooseWord"),
      iconPath: "assets/course/test.svg",
    ),
  ];

  final List<Widget> _listening = [
    TextTaskChooseSound(
      key: PageStorageKey("TextTaskChooseSound"),
      iconPath: "assets/course/test.svg",
    ),
    SoundTaskChooseWord(
      key: PageStorageKey("SoundTaskChooseWord"),
      iconPath: "assets/course/test.svg",
    ),
  ];

  final List<Widget> _writing = [
    SoundTaskWriteWord(
      key: PageStorageKey("SoundTaskWriteWord"),
      iconPath: "assets/course/test.svg",
    ),
    TextTaskWriteWord(
      key: PageStorageKey("TextTaskWriteWord"),
      iconPath: "assets/course/test.svg",
    ),
  ];

  final List<Widget> _speaking = [
    TextTaskSpeakWord(
      key: PageStorageKey("TextTaskSpeakWord"),
      iconPath: "assets/course/test.svg",
    ),
  ];
//
//
  final List<Widget> _general = [
    NewWordPage(
      key: PageStorageKey("NewWordPage"),
    ),
    LearningFinalPage(
      key: PageStorageKey("LearningFinalPage"),
      iconPath: "assets/course/test.svg",
    ),
  ];
//
//
  int _selectedIndex = 0;
  String courseTitle;

  @override
  void initState() {
    super.initState();
  }

  void generateTasks() {
    
  }

  @override
  Widget build(BuildContext context) {
    courseTitle = ScopedModel.of<UserModel>(context, rebuildOnChange: true).courseIndex;

    return Scaffold(
      appBar: AppBarUpper(
        // do naprawienia
        title: "Learning process",
        isCourseAppBar: true,
        onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
        onClosePressed: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            children: this._general,
            onPageChanged: (int index) => setState(() => this._selectedIndex = index),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: LearningLabel(point: this._selectedIndex, points: this._general.length - 1),
          ),
        ],
      ),
    );
  }
}
