import 'package:flutter/material.dart';
import 'package:langapp/components/courses_list/vocabulary_type_data.dart';

class CourseVocabularyData extends StatelessWidget {
  bool isNewCourse;
  final int vocabularyNumber;
  final int learntVocabulary;
  final int repetitionVocabulary;

  CourseVocabularyData({
    @required this.vocabularyNumber,
    @required this.learntVocabulary,
    @required this.repetitionVocabulary,
    this.isNewCourse = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: (isNewCourse ? MainAxisAlignment.center : MainAxisAlignment.spaceEvenly),
        children: <Widget>[
          // all the words of the course
          VocabularyTypeData(
            number: this.vocabularyNumber,
            pathIcon: 'assets/course/all_vocab.svg',
          ),

          // all learnt words by the user; if it is a new course, it doesnt show a number
          (this.isNewCourse
              ? SizedBox()
              : VocabularyTypeData(
                  number: this.learntVocabulary,
                  pathIcon: 'assets/course/known_vocab.svg',
                )),

          // all words to repetition by the user; if it is a new course, it doesnt show a number
          (this.isNewCourse
              ? SizedBox()
              : VocabularyTypeData(
                  number: this.repetitionVocabulary,
                  pathIcon: 'assets/course/review_vocab.svg',
                )),
        ],
      ),
    );
  }
}
