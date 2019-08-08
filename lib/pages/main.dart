import 'package:flutter/material.dart';
import 'package:langapp/pages/learn_page/new_course_start_modal.dart';
import 'package:langapp/pages/learn_page/new_word_page.dart';
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
          NewWordPage(courseTitle: "Course Title"),
          NewCourseStartModal(),
          TheoryPage(courseTitle: "Course Title"),
          UploadCoursePage(courseChoice: "Repetition", courseName: "Course Name"),
        ],
      ),
    );
  }
}
