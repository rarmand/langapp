import 'package:flutter/material.dart';
import 'package:langapp/components/frame/learning_frame.dart';
import 'package:langapp/pages/learn_page/vocabulary_card.dart';

class TheoryPage extends StatelessWidget {
  final String courseTitle;
  List<VocabularyCard> _vocabList = [
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: false),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: false),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
  ];

  TheoryPage({@required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return LearningFrame(
      courseTitle: "Course Title",
      point: 0,
      child: Column(
        children: [
          SizedBox(height: 24.0),
          ...this._vocabList,
          SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
