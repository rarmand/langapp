import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class CourseTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 28.0, bottom: 10.0),
      child: Text(
        "Course Name",
        style: TextStyle(
          color: WHITE,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
