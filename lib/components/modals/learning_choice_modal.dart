import 'package:flutter/material.dart';
import 'package:langapp/components/courses_list/course_box.dart';
import 'package:langapp/components/courses_list/learn_block.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class LearningChoiceModal extends StatelessWidget {
  void _onDeleteCourse(BuildContext context) async {
    await ScopedModel.of<UserModel>(context).deleteCourse();
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/",
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    String courseIndex = ScopedModel.of<UserModel>(context, rebuildOnChange: true).courseIndex;

    return Scaffold(
      backgroundColor: WHITE.withOpacity(0.95),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 48.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    LearnBlock(
                      title: "Theory",
                      iconPath: "assets/course/all_vocab.svg",
                    ),
                    LearnBlock(
                      title: "Session",
                      iconPath: "assets/course/add.svg",
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                CourseBox(index: courseIndex),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    LearnBlock(
                      title: "Repetition",
                      iconPath: "assets/course/review_vocab.svg",
                    ),
                    LearnBlock(
                      title: "Test",
                      iconPath: "assets/course/test.svg",
                    ),
                  ],
                ),
                const SizedBox(height: 28.0),
                InkWell(
                  onTap: () => this._onDeleteCourse(context),
                  child: Text(
                    "Resign from the course",
                    style: TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
