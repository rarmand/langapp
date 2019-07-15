import 'package:flutter/widgets.dart';
import 'package:langapp/components/element_content/element_content.dart';
import 'package:langapp/components/profile_elements/daily_goal_marks.dart';
import 'package:langapp/components/profile_elements/diagnosed_skills_blocks.dart';
import 'package:langapp/components/profile_elements/profile_info_line.dart';

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: <Widget>[
          ProfileInfoLine(name: "Username", data: "User123456789"),
          ProfileInfoLine(name: "Points", data: "12456789"),
          ProfileInfoLine(name: "Longest strike", data: "12"),
          ProfileInfoLine(name: "Tutor", data: "no"),
          ProfileInfoLine(name: "Contests", data: "10"),
          ProfileInfoLine(name: "Challenges", data: "2"),
          ElementContent(title: "Daily goals", element: DailyGoalMarks()),
          ElementContent(
            title: "Diagnosed skills",
            element: DiagnosedSkillsBlocks(),
          ),
        ],
      ),
    );
  }
}
