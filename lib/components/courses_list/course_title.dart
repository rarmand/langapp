import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class CourseTitle extends StatelessWidget {
  final String title;

  CourseTitle({@required this.title = "Course Name"});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.0, bottom: 8.0),
      child: Text(
        // TODO: ograniczenie liczby znaków dla title? do 14 ?
        // jak wrapować tekst ?
        this.title,
        overflow: TextOverflow.visible,
        style: TextStyle(
          color: WHITE,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
