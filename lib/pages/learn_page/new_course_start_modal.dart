import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/courses_list/course_box.dart';
import 'package:langapp/styles/colors.dart';

class NewCourseStartModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE.withOpacity(0.95),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CourseBox(index: 0, type: true, isNewCourse: true),
                SizedBox(height: 64.0),
                ButtonFilled(
                  btnText: "Start",
                  onPressed: () => Navigator.pushNamed(context, "/"),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
