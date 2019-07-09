import 'package:flutter/material.dart';
import 'course_box.dart';

class CoursesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 24.0),
          CourseBox(index: 0, type: false),
          CourseBox(index: 1, type: true),
          CourseBox(index: 2, type: false),
          CourseBox(index: 3, type: true),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
