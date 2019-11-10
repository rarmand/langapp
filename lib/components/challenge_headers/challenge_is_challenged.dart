import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class ChallengeIsChallenged extends StatelessWidget {
  final Function onFinishPressed;

  ChallengeIsChallenged({@required this.onFinishPressed});

  @override
  Widget build(BuildContext context) {
    Map challenge = ScopedModel.of<UserModel>(context, rebuildOnChange: true).challenge;
    debugPrint(ScopedModel.of<UserModel>(context).challenge.toString());

    return challenge == null
        ? Text('Loading...')
        : Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Challenge:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  challenge['title'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: GREEN_LIGHT,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Instruction:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                Text(challenge['description']),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 28.0, bottom: 40.0),
                    child: Text(
                      "We wish you good luck!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: ButtonFilled(
                    btnText: "Finish the challenge",
                    onPressed: this.onFinishPressed,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Finish of the challenge? Next challenge will appear in two weeks.",
                ),
              ],
            ),
          );
  }
}
