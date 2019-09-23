import 'package:flutter/widgets.dart';
import 'package:langapp/components/element_content/element_content.dart';
import 'package:langapp/components/panel_points/block_points.dart';
import 'package:langapp/components/profile_elements/daily_goal_marks.dart';
import 'package:langapp/components/profile_elements/profile_info_line.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  String _username = '...';
  int _longestStrike = 0;
  int _speedTestStrike = 0;
  int _challengesCount = 0;
  int _points = 0;
  List<bool> _dailyGoalsList = [false, false, false, false, false, false, false];

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() async {
    List dailyGoalHistory = ScopedModel.of<UserModel>(context).dailyGoalHistory;

    setState(() {
      _username = ScopedModel.of<UserModel>(context).username;
      _longestStrike = ScopedModel.of<UserModel>(context).longestStrike;
      _speedTestStrike = ScopedModel.of<UserModel>(context).speedTestsStrike;
      _challengesCount = ScopedModel.of<UserModel>(context).userChallenges.length;
      _points = ScopedModel.of<UserModel>(context).points;

      for (int i = 0; i < dailyGoalHistory.length; i++) {
        _dailyGoalsList[i] = dailyGoalHistory[i];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: <Widget>[
          BlockPoints(points: this._points),
          ProfileInfoLine(text: "Username", value: this._username),
          ProfileInfoLine(text: "Longest strike", value: this._longestStrike.toString()),
          ProfileInfoLine(text: "Speed tests strike", value: this._speedTestStrike.toString()),
          ProfileInfoLine(text: "Challenges", value: this._challengesCount.toString()),
          ElementContent(
            title: "Daily goals",
            element: DailyGoalMarks(dailyGoalData: this._dailyGoalsList),
          ),
        ],
      ),
    );
  }
}
