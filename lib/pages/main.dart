import 'package:flutter/material.dart';
import 'package:langapp/pages/home_menu_page/home_controller.dart';

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
          HomeController(),
          // SpeedTestMenuTest(),
          // TextTaskChooseSound(courseTitle: "Course Title"),
          // TextTaskSpeakWord(courseTitle: "Course Title"),
          // TextTaskAssembleWord(courseTitle: "Course Title"),
          // SoundTaskWriteWord(courseTitle: "Course Title"),
          // TextTaskWriteWord(courseTitle: "Course Title"),
          // LearningFinalPage(courseTitle: "Course Title", iconPath: "assets/course/test.svg"),
          // TextTaskChooseWord(courseTitle: "Course Title"),
          // SoundTaskChooseWord(courseTitle: "Course Title"),
          // NewWordPage(courseTitle: "Course Title"),
          // StopLearningProcessModal(),
          // DailyGoalAchievedModal(),
          // NewCourseStartModal(),
          // TheoryPage(courseTitle: "Course Title"),
          // UploadCoursePage(courseChoice: "Repetition", courseName: "Course Name"),
        ],
      ),
    );
  }
}
