import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/pages/learn_page/vocabulary_card.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class LearningFinalPage extends StatelessWidget {
  final bool noWordsToLearn;

  LearningFinalPage({this.noWordsToLearn = false});

  // check daily GoAL
  // dodanie pktów do bazy dla usera

  @override
  Widget build(BuildContext context) {
    Widget icon = SvgPicture.asset(
      ScopedModel.of<UserModel>(context, rebuildOnChange: true).iconProcessPath,
      color: GREEN_DARK,
      height: 104.0,
    );

    Map words = ScopedModel.of<UserModel>(context, rebuildOnChange: true).wordsToLearn;
    List<VocabularyCard> vocabList = [];
    words.forEach((key, value) {
      vocabList.add(
        VocabularyCard(
          vocabulary: value['text'],
          translation: value['translation'],
          isKnown: true,
        ),
      );
    });

    int points = ScopedModel.of<UserModel>(context, rebuildOnChange: true).processPoints;

    if (this.noWordsToLearn) {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: SingleChildScrollView(
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
                icon,
                Container(
                  padding: EdgeInsets.only(top: 64.0, bottom: 24.0),
                  alignment: Alignment.center,
                  child: Text(
                    "You have no more words to learn",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: BROWN_DARK,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
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
                "$points points!",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 32.0),
              icon,
              SizedBox(height: 32.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Learnt words:", style: TextStyle(fontSize: 16.0)),
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  ...vocabList,
                  SizedBox(height: 20.0),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
