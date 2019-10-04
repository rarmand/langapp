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

class LearnPageController extends StatefulWidget {
  @override
  _LearnPageControllerState createState() => _LearnPageControllerState();
}

class _LearnPageControllerState extends State<LearnPageController> {
  final List<Widget> _general = [
    NewWordPage(
      key: PageStorageKey("NewWordPage"),
    ),
    LearningFinalPage(
      key: PageStorageKey("LearningFinalPage"),
      iconPath: "assets/course/add.svg",
    ),
  ];

  final Map<String, List<Widget>> _learningTasks = {
    'speaking': [
      TextTaskSpeakWord(
        key: PageStorageKey("TextTaskSpeakWord"),
        iconPath: "assets/course/add.svg",
      ),
    ],
    'listening': [
      TextTaskChooseSound(
        key: PageStorageKey("TextTaskChooseSound"),
        iconPath: "assets/course/add.svg",
      ),
      SoundTaskChooseWord(
        key: PageStorageKey("SoundTaskChooseWord"),
        iconPath: "assets/course/add.svg",
      ),
    ],
    'reading': [
      TextTaskAssembleWord(
        key: PageStorageKey("TextTaskAssembleWord"),
        iconPath: "assets/course/add.svg",
      ),
      TextTaskChooseWord(
        key: PageStorageKey("TextTaskChooseWord"),
        iconPath: "assets/course/add.svg",
      ),
    ],
    'writing': [
      SoundTaskWriteWord(
        key: PageStorageKey("SoundTaskWriteWord"),
        iconPath: "assets/course/add.svg",
      ),
      TextTaskWriteWord(
        key: PageStorageKey("TextTaskWriteWord"),
        iconPath: "assets/course/add.svg",
      ),
    ],
  };
  final int _numberOfWords = 3;
  final int _numberOfTasks = 10;
  List<Widget> _finalTasks = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // prepared words to learn
    ScopedModel.of<UserModel>(context).setWordsToLearn(amount: this._numberOfWords);
    // generated list of tasks for one session
    this._generateTasks();
  }

  void _generateTasks() {
    // 10 tasks for one session
    // 4 for image and translation of new word
    Map skillset = {'reading': 30, 'listening': 30, 'writing': 30, 'speaking': 10};

    if (ScopedModel.of<UserModel>(context).autoSkillset) {
      skillset.forEach((skill, value) {
        if (ScopedModel.of<UserModel>(context).skillsetDiagnosed.containsKey(skill)) {
          value = ScopedModel.of<UserModel>(context).skillsetDiagnosed[skill];
        }
      });
    } else {
      skillset.forEach((skill, value) {
        if (ScopedModel.of<UserModel>(context).skillsetUser.containsKey(skill)) {
          value = ScopedModel.of<UserModel>(context).skillsetUser[skill];
        }
      });
    }
    // works
    for (int i = 0; i < this._numberOfWords; i++) {
      this._finalTasks.add(this._general[0]);
    }

    // dobieranie ilości zadań zależnie od parametrów skilli
    skillset.forEach((skill, value) {
      List<Widget> skillTasks = this._learningTasks[skill];
      int x = (value / this._numberOfTasks).round();

      while (x > 0) {
        int len = skillTasks.length;
        if (x < skillTasks.length) len = x % skillTasks.length;

        for (int i = 0; i < len; i++) {
          this._finalTasks.add(skillTasks[i]);
        }

        x -= len;
      }
    });

    // wszystkie taski zebrane do listy
    this._finalTasks.add(this._general[1]);
  }

  @override
  Widget build(BuildContext context) {
    String courseTitle = ScopedModel.of<UserModel>(context, rebuildOnChange: true).chosenCourse['title'];

    return Scaffold(
      appBar: AppBarUpper(
        title: courseTitle,
        isCourseAppBar: true,
        onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
        onClosePressed: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
      ),
      body: Stack(
        children: <Widget>[
          PageView(
            children: this._finalTasks,
            onPageChanged: (int index) => setState(() => this._selectedIndex = index),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: LearningLabel(point: this._selectedIndex, points: this._finalTasks.length - 1),
          ),
        ],
      ),
    );
  }
}
