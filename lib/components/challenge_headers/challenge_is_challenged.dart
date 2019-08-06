import 'package:flutter/material.dart';
import 'package:langapp/components/button_filled/button_filled.dart';
import 'package:langapp/components/button_outlined/button_outlined.dart';
import 'package:langapp/styles/colors.dart';

class ChallengeIsChallenged extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(height: 20.0),
          Text(
            "Write a letter to yourself from the future in chosen foreign language.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: GREEN_LIGHT,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 20.0),
          Text("Instruction:"),
          // TODO: to można wstawic do pętli
          Text("- one instruction to do something like this"),
          Text("- one instruction to do something like this"),
          Text("- one instruction to do something like this"),
          Text("- one instruction to do something like this"),
          Text("- one instruction to do something like this"),
          Text("- one instruction to do something like this"),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 30.0, bottom: 50.0),
              child: Text(
                "We wish you good luck!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),

          Text(
            "Finish of the challenge?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
              "Send us a document file or a photo. Our tutor will check it out and decide if the task is made correctly."),
          Text("Soon you will receive a feedback to the task. Check your email box."),
          SizedBox(height: 30.0),
          // TODO: przemyśleć układ funkcjonalności, czy to ma sens logiczny
          Center(
            child: ButtonOutlined(btnText: "Upload file"),
          ),
          SizedBox(height: 5.0),
          Center(
            child: ButtonFilled(btnText: "Finish the challenge"),
          )
        ],
      ),
    );
  }
}
