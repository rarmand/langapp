import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/element_content/daily_goal_panel.dart';
import 'package:langapp/components/element_content/element_button.dart';
import 'package:langapp/components/element_content/element_checkbox.dart';
import 'package:langapp/components/element_content/element_content.dart';
import 'package:langapp/components/frame/menu_frame.dart';
import 'package:langapp/components/modals/learning_settings_edition_modal.dart';
import 'package:langapp/components/modals/profile_edition_modal.dart';
import 'package:langapp/components/profile_elements/diagnosed_skills_blocks.dart';
import 'package:langapp/components/profile_elements/profile_info_line.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SettingsPage extends StatefulWidget {
  final bool diagnosedMethod;

  // TODO: przypilnować konstrukcję settings page
  SettingsPage({Key key, this.diagnosedMethod = true}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return MenuFrame(
      title: "Settings",
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: <Widget>[
            // profile edition
            ProfileInfoLine(name: "Username", data: "User1234567890"),
            ProfileInfoLine(name: "Email", data: "user@pocztex.se"),
            ElementButton(
              name: "Edit profile",
              buttonIcon: Icons.edit,
              onPressed: () => Navigator.of(context).push(
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) => ProfileEditionModal(),
                ),
              ),
            ),
            // daily goal edition
            ElementContent(
              title: "Daily goal",
              subtitle: "Number of words to learn or repeat per day",
              element: DailyGoalPanel(
                isChosen: 0,
              ),
            ),

            ElementButton(
              name: "Log out",
              buttonIcon: Icons.exit_to_app,
              onPressed: this._logOut,
            ),
          ],
        ),
      ),
    );
  }

  Future<Navigator> _logOut() async {
    await FirebaseAuth.instance.signOut();

    ScopedModel.of<UserModel>(context).setUserId(uid: '');
    ScopedModel.of<UserModel>(context).setUsername(username: '');

    return Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false);
  }
}
