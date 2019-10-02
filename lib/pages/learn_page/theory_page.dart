import 'package:flutter/material.dart';
import 'package:langapp/components/frame/learning_frame.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/pages/learn_page/vocabulary_card.dart';
import 'package:scoped_model/scoped_model.dart';

class TheoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String courseTitle = ScopedModel.of<UserModel>(context, rebuildOnChange: true).chosenCourse['title'];
    Map wordsMap = ScopedModel.of<UserModel>(context, rebuildOnChange: true).chosenCourseWords;
    Map wordsLearnt = ScopedModel.of<UserModel>(context, rebuildOnChange: true).wordsLearnt;

    List<Widget> wordsList = [];

    wordsMap.forEach((key, word) {
      bool isKnown = false;
      if (wordsLearnt.containsKey(key)) {
        isKnown = true;
      }

      wordsList.add(VocabularyCard(
        vocabulary: word['text'],
        translation: word['translation'],
        isKnown: isKnown,
      ));
    });

    // sortowanie listy w zależności czy isKnown, isIgnored na końcu, repetition na początek
    // dodanie fonetyki i obrazka
    return LearningFrame(
      title: courseTitle,
      point: 0,
      child: Container(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 24.0),
            Wrap(
              runSpacing: 8.0,
              children: wordsList,
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
