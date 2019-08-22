import 'package:flutter/material.dart';
import 'package:langapp/pages/learn_page/daily_goal_achieved_modal.dart';
import 'package:langapp/pages/learn_page/learning_final_page.dart';
import 'package:langapp/pages/learn_page/new_course_start_modal.dart';
import 'package:langapp/pages/learn_page/new_word_page.dart';
import 'package:langapp/pages/learn_page/sound_task_choose_word.dart';
import 'package:langapp/pages/learn_page/sound_task_write_word.dart';
import 'package:langapp/pages/learn_page/stop_learning_process_modal.dart';
import 'package:langapp/pages/learn_page/text_task_assemble_word.dart';
import 'package:langapp/pages/learn_page/text_task_choose_sound.dart';
import 'package:langapp/pages/learn_page/text_task_choose_word.dart';
import 'package:langapp/pages/learn_page/text_task_speak_word.dart';
import 'package:langapp/pages/learn_page/text_task_write_word.dart';
import 'package:langapp/pages/learn_page/theory_page.dart';
import 'package:langapp/pages/upload_course_page/upload_course_page.dart';

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
          TextTaskChooseSound(),
          TextTaskSpeakWord(courseTitle: "Course Title"),
          TextTaskAssembleWord(courseTitle: "Course Title"),
          SoundTaskWriteWord(courseTitle: "Course Title"),
          TextTaskWriteWord(courseTitle: "Course Title"),
          LearningFinalPage(courseTitle: "Course Title", iconPath: "assets/course/test.svg"),
          TextTaskChooseWord(courseTitle: "Course Title"),
          SoundTaskChooseWord(courseTitle: "Course Title"),
          NewWordPage(courseTitle: "Course Title"),
          StopLearningProcessModal(),
          DailyGoalAchievedModal(),
          NewCourseStartModal(),
          TheoryPage(courseTitle: "Course Title"),
          UploadCoursePage(courseChoice: "Repetition", courseName: "Course Name"),
        ],
      ),
    );
  }
}
