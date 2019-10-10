import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/courses_list/course_header.dart';
import 'package:langapp/components/courses_list/course_skillset.dart';
import 'package:langapp/components/courses_list/course_vocabulary_data.dart';
import 'package:langapp/components/modals/learning_choice_modal.dart';
import 'package:langapp/components/modals/new_course_start_modal.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class CourseBox extends StatefulWidget {
  final String index; // nazwa kursu w db - key
  final bool isNewCourse;

  CourseBox({@required this.index, this.isNewCourse = false});
  @override
  _CourseBoxState createState() => _CourseBoxState();
}

class _CourseBoxState extends State<CourseBox> {
  int _learntWordsNumber = 0;
  int _wordsToRepeatNumber = 0;
  int _allWordsNumber = 0;
  String _courseTitle = '';
  String _courseType = '';
  String _language = '';

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() async {
    DocumentSnapshot dsCourse = await Firestore.instance.collection('courses').document(this.widget.index).get();

    if (dsCourse.exists) {
      Map courseData = dsCourse.data;
      setState(() {
        this._language = courseData['language'];
        this._courseTitle = courseData['title'];
        this._courseType = courseData['type'];
        this._allWordsNumber = courseData['collection_of_words'].length;
      });

      if (!this.widget.isNewCourse) {
        Map userCourses = ScopedModel.of<UserModel>(context).courses;
        if (!this.mounted) return;

        if (userCourses.containsKey(this.widget.index)) {
          setState(() {
            this._learntWordsNumber = userCourses[this.widget.index]['words_learnt'].length;
            this._wordsToRepeatNumber = userCourses[this.widget.index]['words_to_repeat'].length;
          });
        }
      }
    }
  }

  void _onTap(BuildContext context) {
    ScopedModel.of<UserModel>(context).courseIndex = this.widget.index;
    ScopedModel.of<UserModel>(context).setChosenCourse(index: this.widget.index);

    if (this.widget.isNewCourse) {
      Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => NewCourseStartModal(),
      ));
    } else {
      ScopedModel.of<UserModel>(context).setSkillset(index: this.widget.index);
      Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => LearningChoiceModal(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 240.0,
        padding: EdgeInsets.symmetric(vertical: 24.0),
        margin: EdgeInsets.only(left: 24, right: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
          gradient: LinearGradient(
            colors: <Color>[GREEN_DARK, GREEN_LIGHT],
          ),
          boxShadow: [
            BoxShadow(
              color: BROWN_SHADOW_25,
              offset: Offset(0, SHADOW_OFFSET / 2),
              blurRadius: SHADOW_RADIUS,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CourseHeader(
              title: this._courseTitle,
              type: this._courseType,
              language: this._language,
            ),
            CourseVocabularyData(
              vocabularyNumber: this._allWordsNumber,
              learntVocabulary: this._learntWordsNumber,
              repetitionVocabulary: this._wordsToRepeatNumber,
              isNewCourse: this.widget.isNewCourse,
            ),
            CourseSkillset(index: this.widget.index, isNewCourse: this.widget.isNewCourse),
          ],
        ),
      ),
      onTap: () => this._onTap(context),
    );
  }
}
