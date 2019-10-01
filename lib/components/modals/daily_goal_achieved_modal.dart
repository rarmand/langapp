import 'package:flutter/material.dart';
import 'package:langapp/components/profile_elements/daily_goal_marks.dart';
import 'package:langapp/components/welcome_card/daily_goal_img.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';

// TODO: how to build it properly?
class DailyGoalAchievedModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE.withOpacity(0.95),
      body: GestureDetector(
        // onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 24.0),
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 16.0),
                      Text(
                        "Goal strike!",
                        style: TextStyle(
                          color: GREEN_LIGHT,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      DailyGoalImg(
                        timestamp: ScopedModel.of<UserModel>(context, rebuildOnChange: true).dailyGoal,
                        backgroundColor: WHITE,
                        textColor: GREEN_LIGHT,
                      ),
                      // TODO: animacja zdobycia kolejnego daily goal
                      DailyGoalMarks(),
                    ],
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(32.0),
                  margin: EdgeInsets.symmetric(horizontal: 32.0),
                  decoration: BoxDecoration(
                    color: WHITE,
                    borderRadius: BorderRadius.circular(
                      BTN_RADIUS,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: BROWN_SHADOW_25,
                        offset: Offset(0, SHADOW_OFFSET),
                        blurRadius: SHADOW_RADIUS,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
