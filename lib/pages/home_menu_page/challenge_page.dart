import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/challenge_headers/challenge_headers.dart';
import 'package:langapp/components/challenge_headers/challenge_is_challenged.dart';
import 'package:langapp/components/challenge_headers/challenge_not_challenged.dart';
import 'package:langapp/components/frame/menu_frame.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:math';

class ChallengePage extends StatefulWidget {
  ChallengePage({Key key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  bool _isChallenged = false;
  String _challengeId = "";

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() {
    setState(() {
      this._challengeId = ScopedModel.of<UserModel>(context).challengeId;

      if (this._challengeId == "0") {
        this._isChallenged = false;
      } else {
        this._isChallenged = true;
      }
    });
  }

// TODO: funkcja słabo działa

  void _onTakeAChallenge() async {
    // pobranie course_id
    // sprawdzenie czy zostało juz kiedyś użyte
    // wprowazdenie do bazy danych i do scoped model ?
    // dodawanie użytego challenga do challenges dla usera i data zakończenia
    // blokada jeśli nie minął odpowiedni okres czasu od poprzedniego challenga

    // pobranie danych usera
    String uid = ScopedModel.of<UserModel>(context).userId;
    Map usedChallenges = ScopedModel.of<UserModel>(context).userChallenges;

    QuerySnapshot qs = await Firestore.instance.collection("challenges").getDocuments();

    if (qs.documents.toList().length > 0) {
      List<DocumentSnapshot> challengesList = qs.documents.toList();
      List challengesChoice = [];

      // sprawdz ktore challenge juz byly
      challengesList.forEach((challengeDs) {
        if (!usedChallenges.containsKey(challengeDs.documentID.toString())) {
          challengesChoice.add(challengeDs);
        }
      });

      // jeśli sa wolne opcje, korzystaj
      if (challengesChoice.length > 0) {
        // losowanie challenge'u
        Random rnd = new Random.secure();
        DocumentSnapshot choiceDs = challengesChoice[rnd.nextInt(challengesList.length)];

        // wstawianie do bazy i do modelu
        await Firestore.instance
            .collection('users')
            .document(uid)
            .updateData({'challenge_id': choiceDs.documentID.toString()});

        Map newChallenge = {
          'challengeId': choiceDs.documentID.toString(),
          'title': choiceDs.data['title'],
          'description': choiceDs.data['description'],
        };
        ScopedModel.of<UserModel>(context).setChallenge(challenge: newChallenge);

        setState(() {
          this._isChallenged = true;
          this._challengeId = choiceDs.documentID.toString();
        });
      } else {
        // alert że wszystkie na ten moment wykorzystane
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: Text(
                  "All challenges used",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: <Widget>[
                  Text("You used all challenges! Wait until new challenges appear"),
                ],
                contentPadding: EdgeInsets.all(24.0),
              );
            });
      }
    }
  }

  void _onFinishChallenge() async {
    ScopedModel.of<UserModel>(context).setChallenge(isFinished: true);

    setState(() {
      this._isChallenged = false;
      this._challengeId = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget beforeChallengeWidget = ChallengeNotChallenged(
      onTap: this._onTakeAChallenge,
      disabled: false,
    );
    Widget afterChallengeWidget = ChallengeIsChallenged(
      onFinishPressed: this._onFinishChallenge,
    );

    return MenuFrame(
      title: "Challenge",
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: <Widget>[
            ChallengeHeaders(isChallenged: this._isChallenged),
            SizedBox(height: 20.0),
            (_isChallenged ? afterChallengeWidget : beforeChallengeWidget),
          ],
        ),
      ),
    );
  }
}
