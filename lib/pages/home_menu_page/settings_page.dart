import 'package:flutter/material.dart';
import 'package:langapp/components/element_content/daily_goal_panel.dart';
import 'package:langapp/components/element_content/element_button.dart';
import 'package:langapp/components/element_content/element_checkbox.dart';
import 'package:langapp/components/element_content/element_content.dart';
import 'package:langapp/components/frame/menu_frame.dart';
import 'package:langapp/components/profile_elements/diagnosed_skills_blocks.dart';
import 'package:langapp/components/profile_elements/profile_info_line.dart';
import 'package:langapp/styles/colors.dart';

class SettingsPage extends StatelessWidget {
  final bool diagnosedMethod;

  // TODO: przypilnować konstrukcję settings page
  SettingsPage({Key key, this.diagnosedMethod = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuFrame(
      title: "Settings",
      chosen: 3,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: <Widget>[
            ProfileInfoLine(name: "Username", data: "User1234567890"),
            ProfileInfoLine(name: "Email", data: "user@pocztex.se"),
            ElementButton(name: "Edit profile", buttonIcon: Icons.edit),
            ElementContent(
              title: "Daily goal",
              subtitle: "Number of words to learn or repeat per day",
              element: DailyGoalPanel(
                isChosen: 0,
              ),
            ),
            ElementContent(
              title: "Learning settings",
              subtitle:
                  "Diagnosed method of learning with the application algorithm.\n\nPresented values inform which skill works better in learning process.",
              element: DiagnosedSkillsBlocks(isChosen: this.diagnosedMethod),
            ),
            ElementContent(
              subtitle: "The method of learning set by the user.\n\nYou can set your way of learning below.",
              element: DiagnosedSkillsBlocks(isChosen: !this.diagnosedMethod),
            ),
            ElementCheckbox(name: "Choose your method of learning", isChecked: this.diagnosedMethod),
            ElementButton(name: "Edit my method", buttonIcon: Icons.edit),
            ElementButton(
              name: "Log out",
              buttonIcon: Icons.exit_to_app,
              // TODO: how to do it? exit and close everything and clear memory
              onPressed: () => Navigator.popAndPushNamed(context, "/login"),
            ),
          ],
        ),
      ),
    );
  }
}
