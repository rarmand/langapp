import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/pages/learn_page/vocabulary_card.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class LearningFinalPage extends StatefulWidget {
  final bool noWordsToLearn;
  final bool isSpeedTest;

  LearningFinalPage({this.noWordsToLearn = false, this.isSpeedTest = false});

  @override
  _LearningFinalPageState createState() => _LearningFinalPageState();
}

class _LearningFinalPageState extends State<LearningFinalPage> {
  int _points = 0;

  @override
  void initState() {
    super.initState();

    if (this.widget.noWordsToLearn) {
      return;
    }

    if (this.widget.isSpeedTest) {
      bool isRecordAchieved = ScopedModel.of<UserModel>(context).checkSpeedTestStrike();
      print(isRecordAchieved);
    }

    this._points = ScopedModel.of<UserModel>(context).processPoints;
    ScopedModel.of<UserModel>(context).pushPointsToDb(this._points);
  }

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
          isKnown: (!this.widget.isSpeedTest),
        ),
      );
    });

    if (this.widget.noWordsToLearn) {
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
                    "Learning process accomplished!",
                    textAlign: TextAlign.center,
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
                  "Learning session accomplished!",
                  textAlign: TextAlign.center,
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
                this._points.toString() + " points!",
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
