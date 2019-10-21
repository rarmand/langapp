import 'package:flutter/material.dart';
import 'package:langapp/components/profile_elements/daily_goal_marks.dart';
import 'package:langapp/components/welcome_card/daily_goal_img.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

class DailyGoalAchievedModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int dailyGoal = ScopedModel.of<UserModel>(context, rebuildOnChange: true).dailyGoal;

    return SimpleDialog(
      title: Text(
        "Goal strike!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: BROWN_DARK,
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
      ),
      children: <Widget>[
        DailyGoalImg(
          timestamp: dailyGoal,
          backgroundColor: WHITE,
          textColor: GREEN_LIGHT,
        ),
        // TODO: animacja zdobycia kolejnego daily goal
        DailyGoalMarks(),
      ],
      contentPadding: EdgeInsets.fromLTRB(24, 24, 24, 24),
      backgroundColor: WHITE.withOpacity(0.95),
    );
  }
}
