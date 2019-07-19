import 'package:flutter/material.dart';
import 'package:langapp/components/element_content/element_single_block.dart';
import 'package:langapp/styles/colors.dart';

class ChallengeHeaders extends StatelessWidget {
  bool isTutor;
  bool isChallenged;

  ChallengeHeaders({this.isTutor = false, this.isChallenged = false});

  @override
  Widget build(BuildContext context) {
    ElementSingleBlock pointsBlock = ElementSingleBlock(
      title: "2533",
      subtitle: "your points",
      gradient: [BROWN_LIGHT, BROWN_DARK],
    );

    ElementSingleBlock challengeBlock = ElementSingleBlock(
      title: "Challenge!",
      subtitle: "500 points",
      gradient: [GREEN_LIGHT, GREEN_DARK],
    );

    ElementSingleBlock tutorBlock = ElementSingleBlock(
      title: "Tutor!",
      subtitle: "Test yourself",
      gradient: [YELLOW, YELLOW],
    );

    Widget finalHeader;

    if (isTutor && isChallenged) {
      finalHeader = Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(-0.5, 0.5),
            child: pointsBlock,
          ),
          Align(
            alignment: Alignment(0.0, 0.0),
            child: tutorBlock,
          ),
          Align(
            alignment: Alignment(0.5, -0.5),
            child: challengeBlock,
          ),
        ],
      );
    } else if (isTutor) {
      finalHeader = Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(-0.5, 0.5),
            child: pointsBlock,
          ),
          Align(
            alignment: Alignment(0.5, -0.5),
            child: tutorBlock,
          ),
        ],
      );
    } else if (isChallenged) {
      finalHeader = Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(-0.5, 0.5),
            child: pointsBlock,
          ),
          Align(
            alignment: Alignment(0.5, -0.5),
            child: challengeBlock,
          ),
        ],
      );
    } else {
      finalHeader = pointsBlock;
    }

    return finalHeader;
  }
}
