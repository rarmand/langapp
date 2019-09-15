import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/courses_list/course_box.dart';
import 'package:langapp/components/modals/learning_choice_modal.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class NewCourseStartModal extends StatefulWidget {
  final String index;

  NewCourseStartModal({@required this.index});

  @override
  _NewCourseStartModalState createState() => _NewCourseStartModalState();
}

class _NewCourseStartModalState extends State<NewCourseStartModal> {
  Future _setNewCourse() async {
    String userId = ScopedModel.of<UserModel>(context).userId;
    DocumentSnapshot ds = await Firestore.instance.collection('users').document(userId).get();

    if (ds.exists) {
      print(ds.data);
      Map courses = ds.data['courses'];

      courses[this.widget.index] = {
        'points': 0,
        'learnt_words': 0,
        'words_to_repeat': 0,
        'skills': {
          "auto": false,
          "listening": 25,
          "listening_auto": 25,
          "speaking": 25,
          "speaking_auto": 25,
          "reading": 25,
          "reading_auto": 25,
          "writing": 25,
          "writing_auto": 25,
        },
      };

      print(courses);
      Firestore.instance.collection("users").document(userId).updateData({"courses": courses});
    }
  }

  void _onPressed() async {
    // dodać nowy kurs do bazy danych
    await this._setNewCourse();

    Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false);
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) => LearningChoiceModal(index: this.widget.index),
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
                CourseBox(
                  index: this.widget.index,
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
