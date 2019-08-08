import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/modals/learning_choice_modal.dart';
import 'package:langapp/styles/colors.dart';

import 'course_header.dart';
import 'course_vocabulary_data.dart';

class CourseBox extends StatelessWidget {
  final int index;
  final bool type; // type: grammar=0 or vocab=1;
  bool isNewCourse;

  // TODO: 2 themes, dla grammar i dla vocab
  CourseBox({this.index, @required this.type, this.isNewCourse = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180.0,
        margin: EdgeInsets.only(left: 24, right: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
          gradient: LinearGradient(
            colors: <Color>[
              GREEN_DARK,
              GREEN_LIGHT,
            ],
          ),
          // TODO: boxshadow mozna dodać jako uniwersalny komponent, często używane
          boxShadow: [
            BoxShadow(
              color: BROWN_SHADOW_25,
              offset: Offset(0, SHADOW_OFFSET / 2),
              blurRadius: SHADOW_RADIUS,
            )
          ],
        ),
        child: Column(
          children: [
            CourseHeader(),
            CourseVocabularyData(
              vocabularyNumber: 200,
              learntVocabulary: 40,
              repetitionVocabulary: 10,
              isNewCourse: this.isNewCourse,
            ),
          ],
        ),
      ),
      // TODO: zapytać Dawida czy taki modal jest okk
      // TODO: modal do włączenia tylko przy odpowiednich okazjach - nie zawsze dostępny
      onTap: () => Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) => LearningChoiceModal(),
        ),
      ),
    );
  }
}
