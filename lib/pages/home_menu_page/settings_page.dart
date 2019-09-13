import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:langapp/components/element_content/daily_goal_panel.dart';
import 'package:langapp/components/element_content/element_button.dart';
import 'package:langapp/components/element_content/element_content.dart';
import 'package:langapp/components/frame/menu_frame.dart';
import 'package:langapp/components/modals/profile_edition_modal.dart';
import 'package:langapp/components/profile_elements/profile_info_line.dart';
import 'package:langapp/model/app_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _username = "";
  String _email = "";
  int _dailyGoal = 10;

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() async {
    String userUid = ScopedModel.of<UserModel>(context).userId;
    print(userUid); // works

    setState(() {
      _username = ScopedModel.of<UserModel>(context).username;
      _email = ScopedModel.of<UserModel>(context).email;
      _dailyGoal = ScopedModel.of<UserModel>(context).dailyGoal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MenuFrame(
      title: "Settings",
      child: Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            // profile edition
            ProfileInfoLine(text: "Username", value: this._username),
            ProfileInfoLine(text: "Email", value: this._email),
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
                number: this._dailyGoal,
              ),
            ),
            const SizedBox(height: 24.0),
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
    ScopedModel.of<UserModel>(context).setDailyGoal(dailyGoal: 10);
    ScopedModel.of<UserModel>(context).setEmail(email: "");

    return Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false);
  }
}
