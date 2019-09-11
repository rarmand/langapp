import 'package:flutter/material.dart';
import 'package:langapp/components/frame/welcome_frame.dart';
import 'package:langapp/components/rich_text/rich_text_widget.dart';
import 'package:langapp/components/courses_list/course_box.dart';
import 'package:langapp/styles/colors.dart';

class NewCourseChoicePage extends StatefulWidget {
  @override
  _NewCourseChoicePageState createState() => _NewCourseChoicePageState();
}

class _NewCourseChoicePageState extends State<NewCourseChoicePage> {
  List<Widget> coursesList = [
    CourseBox(index: 0, isNewCourse: true),
    CourseBox(index: 1, isNewCourse: true),
    CourseBox(index: 2, isNewCourse: true),
    CourseBox(index: 3, isNewCourse: true),
  ];

  final List<TextSpan> _title = <TextSpan>[
    TextSpan(
      text: "Choose \n",
      style: TextStyle(
        color: BROWN_DARK,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
    TextSpan(
      text: "a new course",
      style: TextStyle(
        color: GREEN_LIGHT,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WelcomeFrame(
      onPressedNext: () => Navigator.pushNamed(context, "/"),
      onPressedBack: () => Navigator.pop(context),
      title: RichTextWidget(textLines: this._title),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 60.0),
          // TODO: zapytac jak to dobrze zrobić, żeby inkwell tak brzydko nie wyglądał jak się klika
          Wrap(
            runSpacing: 24.0,
            children: coursesList,
          ),
          SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
