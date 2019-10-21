import 'package:flutter/material.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class DailyGoalMarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Mark> goals = [];
    ScopedModel.of<UserModel>(context, rebuildOnChange: true)
        .dailyGoalStamps
        .forEach((goal) => goals.add(Mark(isMarked: goal)));

    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Wrap(
        runSpacing: 4.0,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.spaceBetween,
        children: goals,
      ),
    );
  }
}

class Mark extends StatelessWidget {
  final bool isMarked;

  Mark({@required this.isMarked});

  @override
  Widget build(BuildContext context) {
    Widget circle = new Container(
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: (this.isMarked ? [GREEN_DARK, GREEN_LIGHT] : [GRAY.withAlpha(120), GRAY]),
        ),
        shape: BoxShape.circle,
        border: Border.all(color: BROWN_SHADOW_25, width: 2),
      ),
    );

    return Container(
      margin: EdgeInsets.all(4.0),
      child: circle,
    );
  }
}
