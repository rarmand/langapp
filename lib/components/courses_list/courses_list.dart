import 'package:flutter/material.dart';
import 'package:langapp/components/panel_points/panel_points.dart';
import 'course_box.dart';

class CoursesList extends StatelessWidget {
  List<Widget> coursesList = [
    CourseBox(index: 0, type: false),
    CourseBox(index: 1, type: true),
    CourseBox(index: 2, type: false),
    CourseBox(index: 3, type: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PanelPoints(),
        SizedBox(height: 24.0),
        // TODO: zapytac jak to dobrze zrobić, żeby inkwell tak brzydko nie wyglądał jak się klika
        Wrap(
          runSpacing: 24.0,
          children: coursesList,
        ),
        SizedBox(height: 24.0),
      ],
    );
  }
}
