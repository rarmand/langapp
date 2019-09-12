import 'package:flutter/widgets.dart';
import 'package:langapp/components/element_content/element_content.dart';
import 'package:langapp/components/panel_points/block_points.dart';
import 'package:langapp/components/profile_elements/daily_goal_marks.dart';
import 'package:langapp/components/profile_elements/profile_info_line.dart';

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: <Widget>[
          BlockPoints(),
          ProfileInfoLine(name: "Username", data: "User123456789"),
          ProfileInfoLine(name: "Longest strike", data: "12"),
          ProfileInfoLine(name: "Speed tests", data: "10"),
          ProfileInfoLine(name: "Challenges", data: "2"),
          ElementContent(
            title: "Daily goals",
            element: DailyGoalMarks(),
          ),
        ],
      ),
    );
  }
}
