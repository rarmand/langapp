import 'package:flutter/material.dart';
import 'package:langapp/components/courses_list/vocabulary_type_data.dart';

class CourseVocabularyData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          VocabularyTypeData(
            pathIcon: 'assets/course/all_vocab.svg',
          ),
          VocabularyTypeData(
            pathIcon: 'assets/course/known_vocab.svg',
          ),
          VocabularyTypeData(
            pathIcon: 'assets/course/review_vocab.svg',
          ),
        ],
      ),
    );
  }
}
