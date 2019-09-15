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
  List<Widget> _coursesList = [];
  List _userCoursesKeys;

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
  void initState() {
    super.initState();
    this._getUserData();
  }

  void _getUserData() async {
    String userId = ScopedModel.of<UserModel>(context).userId;
    DocumentSnapshot ds = await Firestore.instance.collection('users').document(userId).get();
    if (ds.exists) {
      setState(() {
        this._userCoursesKeys = ds.data['courses'].keys.toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              if (!snapshot.hasData) return const Text("Loading...");

              this._coursesList.removeRange(0, this._coursesList.length);
              String language = ScopedModel.of<UserModel>(context).language.toLowerCase();

              QuerySnapshot courses = snapshot.data;
              int coursesNumber = courses.documents.length;

              for (int i = 0; i < coursesNumber; i++) {
                if (this._userCoursesKeys == null) this._userCoursesKeys = [];

                if (this._userCoursesKeys.contains(courses.documents[i].documentID)) {
                  // print("user uses such a course: " + courses.documents[i].documentID.toString());
                } else if (courses.documents[i].data['language'] == language) {
                  // print("found by language: " + courses.documents[i].documentID);
                  _coursesList.add(
                    CourseBox(
                      index: courses.documents[i].documentID,
                      isNewCourse: true,
                    ),
                  );
                }
                // else {
                //   print("something else: " + courses.documents[i].documentID.toString());
                //   print(this._coursesList);
                // }
              }

              return Wrap(
                runSpacing: 24.0,
                children: this._coursesList,
              );
            },
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
