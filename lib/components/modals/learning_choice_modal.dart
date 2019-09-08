import 'package:flutter/material.dart';
import 'package:langapp/components/courses_list/course_box.dart';
import 'package:langapp/components/courses_list/learn_block.dart';
import 'package:langapp/styles/colors.dart';

// TODO: scrollowanie
// TODO: zablokować background , zeby nic tam nie dzialalo po nacisnięciu
class LearningChoiceModal extends StatelessWidget {
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
              children: <Widget>[
                SizedBox(height: 20.0),
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
                SizedBox(height: 20.0),
                CourseBox(index: 0, type: true),
                SizedBox(height: 20.0),
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
                SizedBox(height: 28.0),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    "Resign from the course",
                    style: TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
