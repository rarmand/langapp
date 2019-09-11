import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/courses_list/course_skillset.dart';
import 'package:langapp/components/modals/learning_choice_modal.dart';
import 'package:langapp/components/modals/new_course_start_modal.dart';
import 'package:langapp/styles/colors.dart';

import 'course_header.dart';
import 'course_vocabulary_data.dart';

class CourseBox extends StatelessWidget {
  final int index;
  bool isNewCourse;

  // TODO: 2 themes, dla grammar i dla vocab
  CourseBox({this.index, this.isNewCourse = false});

  void _onTap(BuildContext context) {
    if (this.isNewCourse)
      Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => NewCourseStartModal(),
      ));
    else
      Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => LearningChoiceModal(),
      ));
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
            CourseHeader(),
            CourseVocabularyData(
              vocabularyNumber: 200,
              learntVocabulary: 40,
              repetitionVocabulary: 10,
              isNewCourse: this.isNewCourse,
            ),
            CourseSkillset(),
          ],
        ),
      ),
      // TODO: zapytać Dawida czy taki modal jest okk
      // TODO: modal do włączenia tylko przy odpowiednich okazjach - nie zawsze dostępny
      onTap: () => this._onTap(context),
    );
  }
}
