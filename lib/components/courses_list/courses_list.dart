import 'package:flutter/material.dart';
import 'course_box.dart';

class CoursesList extends StatelessWidget {
  final List<CourseBox> coursesList = [
    CourseBox(index: 0),
    CourseBox(index: 1),
    CourseBox(index: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 24.0),
          CourseBox(index: 0),
          CourseBox(index: 1),
          CourseBox(index: 2),
          CourseBox(index: 3),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
