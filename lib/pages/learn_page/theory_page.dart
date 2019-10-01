import 'package:flutter/material.dart';
import 'package:langapp/components/frame/learning_frame.dart';
import 'package:langapp/pages/learn_page/vocabulary_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  Widget _createList(context, String vocab, int size) {
    List<VocabularyCard> vocabulary = [];

    for (int i = 0; i < size; i++) {
      vocabulary.add(VocabularyCard(
        vocabulary: vocab,
        translation: "mamma mia",
        isKnown: false,
      ));
    }
  }

  Widget _getWordCard(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Column(
        children: <Widget>[
          VocabularyCard(
            vocabulary: document['word'],
            translation: document['translation'],
            isKnown: true,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LearningFrame(
      point: 0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: this._vocabList.length,
        itemBuilder: (context, index) => this._vocabList[index],
      ),
    );
  }
}
