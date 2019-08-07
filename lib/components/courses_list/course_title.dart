import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class CourseTitle extends StatelessWidget {
  final String title;

  CourseTitle({@required this.title = "Course Name"});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 28.0, bottom: 10.0),
      child: Text(
        // TODO: ograniczenie liczby znaków dla title? do 14 ?
        this.title,
        style: TextStyle(
          color: WHITE,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
