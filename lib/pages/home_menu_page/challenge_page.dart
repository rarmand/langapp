import 'package:flutter/material.dart';
import 'package:langapp/components/challenge_headers/challenge_headers.dart';
import 'package:langapp/components/challenge_headers/challenge_is_challenged.dart';
import 'package:langapp/components/challenge_headers/challenge_is_tutor.dart';
import 'package:langapp/components/challenge_headers/challenge_not_challenged.dart';
import 'package:langapp/components/challenge_headers/challenge_not_tutor.dart';
import 'package:langapp/components/frame/menu_frame.dart';

class ChallengePage extends StatelessWidget {
  bool isTutor = false;
  bool isChallenged = true;

  ChallengePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget beforeChallengeWidget = ChallengeNotChallenged();
    Widget beforeTutorWidget = ChallengeNotTutor(userPoints: 5333);
    Widget afterChallengeWidget = ChallengeIsChallenged();
    Widget afterTutorWidget = ChallengeIsTutor();

    return MenuFrame(
      title: "Challenge",
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: <Widget>[
            ChallengeHeaders(isTutor: this.isTutor, isChallenged: this.isChallenged),
            SizedBox(height: 20.0),
            (isChallenged ? afterChallengeWidget : beforeChallengeWidget),
            SizedBox(height: 20.0),
            (isTutor ? afterTutorWidget : beforeTutorWidget),
          ],
        ),
      ),
    );
  }
}
