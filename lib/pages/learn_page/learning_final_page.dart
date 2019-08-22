import 'package:flutter/material.dart';
import 'package:langapp/components/frame/learning_frame.dart';
import 'package:langapp/pages/learn_page/vocabulary_card.dart';
import 'package:langapp/styles/colors.dart';

class LearningFinalPage extends StatelessWidget {
  final String courseTitle;
  final int points = 256999;
  final String iconPath;
  Widget icon;

  List<VocabularyCard> _vocabList = [
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
    VocabularyCard(vocabulary: "a man", translation: "mężczyzna", isKnown: true),
  ];

  LearningFinalPage({@required this.courseTitle, @required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return LearningFrame(
      courseTitle: this.courseTitle,
      point: 10,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 64.0, bottom: 40.0),
            alignment: Alignment.center,
            child: Text(
              "Session accomplished!",
              style: TextStyle(
                color: GREEN_LIGHT,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            "You achieved",
            style: TextStyle(
              fontSize: 18.0,
              color: GREEN_LIGHT,
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            this.points.toString() + " points!",
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 32.0),
          Icon(
            Icons.public,
            size: 48.0,
            color: GREEN_DARK,
          ),
          SizedBox(height: 32.0),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("Learnt words:", style: TextStyle(fontSize: 16.0)),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              ...this._vocabList,
              SizedBox(height: 20.0),
            ],
          )
        ],
      ),
    );
  }
}
