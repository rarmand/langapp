import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/courses_list/course_box.dart';
import 'package:langapp/components/modals/learning_choice_modal.dart';
import 'package:langapp/styles/colors.dart';

class NewCourseStartModal extends StatelessWidget {
  final String index;

  NewCourseStartModal({@required this.index});

  void _onPressed(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false);
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) => LearningChoiceModal(index: this.index),
    ));
  }

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
                const SizedBox(height: 16.0),
                CourseBox(index: this.index, isNewCourse: true),
                const SizedBox(height: 64.0),
                ButtonFilled(
                  btnText: "Start",
                  onPressed: () => this._onPressed(context),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
