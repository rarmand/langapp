import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/element_content/element_content.dart';
import 'package:langapp/components/frame/menu_frame.dart';
import 'package:langapp/components/panel_points/block_points.dart';
import 'package:langapp/components/profile_elements/daily_goal_marks.dart';
import 'package:langapp/components/profile_elements/profile_info_line.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = ScopedModel.of<UserModel>(context, rebuildOnChange: true).username;
    int longestStrike = ScopedModel.of<UserModel>(context, rebuildOnChange: true).longestStrike;
    int speedTestStrike = ScopedModel.of<UserModel>(context, rebuildOnChange: true).speedTestStrike;
    int challengesCount = ScopedModel.of<UserModel>(context, rebuildOnChange: true).userChallenges.length;
    int points = ScopedModel.of<UserModel>(context, rebuildOnChange: true).points;

    return MenuFrame(
      title: "Profile",
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: <Widget>[
            BlockPoints(points: points),
            ProfileInfoLine(text: "Username", value: username),
            ProfileInfoLine(text: "Longest strike", value: longestStrike.toString()),
            ProfileInfoLine(text: "Speed tests strike", value: speedTestStrike.toString()),
            ProfileInfoLine(text: "Challenges", value: challengesCount.toString()),
            ElementContent(
              title: "Daily goals",
              element: DailyGoalMarks(),
            ),
          ],
        ),
      ),
    );
  }
}
