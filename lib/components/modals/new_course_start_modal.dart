import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/courses_list/course_box.dart';
import 'package:langapp/components/modals/learning_choice_modal.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class NewCourseStartModal extends StatefulWidget {
  NewCourseStartModal();

  @override
  _NewCourseStartModalState createState() => _NewCourseStartModalState();
}

class _NewCourseStartModalState extends State<NewCourseStartModal> {
  void _onPressed() async {
    // dodać nowy kurs do bazy danych
    await ScopedModel.of<UserModel>(context).setNewCourse();
    ScopedModel.of<UserModel>(context).setSkillset(index: ScopedModel.of<UserModel>(context).courseIndex);

    Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false);
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) => LearningChoiceModal(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    String courseIndex = ScopedModel.of<UserModel>(context).courseIndex;

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
                CourseBox(
                  index: courseIndex,
                  isNewCourse: true,
                ),
                const SizedBox(height: 64.0),
                ButtonFilled(
                  btnText: "Start",
                  onPressed: () => this._onPressed(),
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
