import 'package:flutter/material.dart';
import 'package:langapp/styles/colors.dart';

class ChallengeIsTutor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Tutor as a challenge:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 20.0),
          Text("We are very proud that you decided to become a tutor"),
          SizedBox(height: 20.0),
          Text("It is a great challenge to learn more with other users."),
          Text("Help others by checking their tasks, challenges and take more pleasure from learning languages."),
          SizedBox(height: 20.0),
          Text("As a tutor, you will achieve two times more points with every new learnt word."),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 40.0),
              padding: EdgeInsets.all(40.0),
              child: Text(
                "Check your email box",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(BTN_RADIUS)),
                border: Border.all(
                  color: BROWN_DARK,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
