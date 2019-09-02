import 'package:flutter/material.dart';
import 'package:langapp/components/panel_points/button_course.dart';

// TODO: onPressed funkcje
class ButtonsCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ButtonCourse(
            name: "Add a new course to learn",
            icon: Icons.add_box,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
