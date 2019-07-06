import 'package:flutter/material.dart';
import 'package:langapp/components/panel_points/button_course.dart';
import 'package:langapp/styles/colors.dart';

class ButtonsCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtonCourse(name: "Add a course", icon: Icons.add_box),
          ButtonCourse(name: "Create a course", icon: Icons.create),
        ],
      ),
    );
  }
}
