import 'package:flutter/material.dart';
import 'package:langapp/components/element_content/element_single_block.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class ChallengeHeaders extends StatelessWidget {
  final bool isTutor;
  final bool isChallenged;

  ChallengeHeaders({this.isTutor = false, this.isChallenged = false});

  @override
  Widget build(BuildContext context) {
    int points = ScopedModel.of<UserModel>(context, rebuildOnChange: true).points;

    ElementSingleBlock pointsBlock = ElementSingleBlock(
      title: points.toString(),
      subtitle: "your points",
      gradient: [BROWN_LIGHT, BROWN_DARK],
    );

    ElementSingleBlock challengeBlock = ElementSingleBlock(
      title: "Challenge!",
      subtitle: "500 points",
      gradient: [GREEN_LIGHT, GREEN_DARK],
    );

    Widget finalHeader;

    if (isChallenged) {
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
