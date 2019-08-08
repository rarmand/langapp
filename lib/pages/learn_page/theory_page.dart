import 'package:flutter/material.dart';
import 'package:langapp/components/appbar_upper/appbar_upper.dart';
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
    return Scaffold(
      appBar: AppBarUpper(
        title: this.courseTitle,
        isCourseAppBar: true,
        onLogoTap: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
        onClosePressed: () => Navigator.pushNamedAndRemoveUntil(context, "/", (Route<dynamic> route) => false),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24.0),
              ...this._vocabList,
              SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
