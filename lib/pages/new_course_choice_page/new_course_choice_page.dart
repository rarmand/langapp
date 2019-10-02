import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/frame/welcome_frame.dart';
import 'package:langapp/components/rich_text/rich_text_widget.dart';
import 'package:langapp/components/courses_list/course_box.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class NewCourseChoicePage extends StatefulWidget {
  @override
  _NewCourseChoicePageState createState() => _NewCourseChoicePageState();
}

class _NewCourseChoicePageState extends State<NewCourseChoicePage> {
  final List<TextSpan> _title = <TextSpan>[
    TextSpan(
      text: "Choose \n",
      style: TextStyle(
        color: BROWN_DARK,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
    TextSpan(
      text: "a new course",
      style: TextStyle(
        color: GREEN_LIGHT,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List userCoursesKeys = ScopedModel.of<UserModel>(context).courses.keys.toList();

    return WelcomeFrame(
      onPressedNext: () => Navigator.pushNamed(context, "/"),
      onPressedBack: () => Navigator.pop(context),
      title: RichTextWidget(textLines: this._title),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 60.0),
          StreamBuilder(
            stream: Firestore.instance.collection("courses").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || userCoursesKeys == null) return const Text("Loading...");

              String language = ScopedModel.of<UserModel>(context).language.toLowerCase();
              QuerySnapshot courses = snapshot.data;

              return Wrap(
                runSpacing: 24.0,
                children: courses.documents
                    .where((doc) => !userCoursesKeys.contains(doc.documentID) && doc.data['language'] == language)
                    .map(
                  (doc) {
                    return CourseBox(
                      index: doc.documentID,
                      isNewCourse: true,
                    );
                  },
                ).toList(),
              );
            },
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
