import 'package:flutter/material.dart';
import 'package:langapp/pages/learn_page/choose_letters_translation_task.dart';
import 'package:langapp/pages/learn_page/daily_goal_achieved_modal.dart';
import 'package:langapp/pages/learn_page/learning_final_page.dart';
import 'package:langapp/pages/learn_page/new_course_start_modal.dart';
import 'package:langapp/pages/learn_page/new_word_page.dart';
import 'package:langapp/pages/learn_page/speak_sound_word_task.dart';
import 'package:langapp/pages/learn_page/theory_page.dart';
import 'package:langapp/pages/learn_page/write_translation_task.dart';
import 'package:langapp/pages/upload_course_page/upload_course_page.dart';

import 'learn_page/choose_sound_translation_task.dart';
import 'learn_page/choose_translation_task.dart';
import 'learn_page/write_sound_translation_task.dart';

class IntroPagesView extends StatefulWidget {
  _IntroPagesView createState() {
    return _IntroPagesView();
  }
}

// TODO: responsywność aplikacji
class _IntroPagesView extends State<IntroPagesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          DailyGoalAchievedModal(),
          SpeakSoundWordTask(courseTitle: "Course Title"),
          ChooseLettersTranslationTask(courseTitle: "Course Title"),
          WriteSoundTranslationTask(courseTitle: "Course Title"),
          WriteTranslationTask(courseTitle: "Course Title"),
          LearningFinalPage(courseTitle: "Course Title", iconPath: "assets/course/test.svg"),
          ChooseTranslationTask(courseTitle: "Course Title"),
          ChooseSoundTranslationTask(courseTitle: "Course Title"),
          NewWordPage(courseTitle: "Course Title"),
          NewCourseStartModal(),
          TheoryPage(courseTitle: "Course Title"),
          UploadCoursePage(courseChoice: "Repetition", courseName: "Course Name"),
        ],
      ),
    );
  }
}
