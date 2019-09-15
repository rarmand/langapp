import 'package:cloud_firestore/cloud_firestore.dart';
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
    String userId = ScopedModel.of<UserModel>(context).userId;
    DocumentSnapshot ds = await Firestore.instance.collection("users").document(userId).get();

    if (ds.exists) {
      setState(() {
        _username = ScopedModel.of<UserModel>(context).username;
        _longestStrike = ds.data['longest_strike'];
        _speedTestStrike = ds.data['speed_test_strike'];
        _challengesCount = ds.data['challenges'].length;
        _points = ScopedModel.of<UserModel>(context).points;

        // jak to można lepiej napisać?
        for (int i = 0; i < ds.data['daily_goal_history'].length; i++) {
          _dailyGoalsList[i] = ds.data['daily_goal_history'][i];
        }
      });
    }
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
