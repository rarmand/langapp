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

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() async {
    setState(() {
      _username = ScopedModel.of<UserModel>(context).username;
      _email = ScopedModel.of<UserModel>(context).email;
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
              element: DailyGoalPanel(),
            ),
            const SizedBox(height: 24.0),
            ElementButton(
              name: "Log out",
              buttonIcon: Icons.exit_to_app,
              onPressed: this._logOut,
            ),
            ElementButton(
              name: "Delete an account",
              buttonIcon: Icons.delete_outline,
              onPressed: this._deleteAccount,
            ),
          ],
        ),
      ),
    );
  }

  void _logOut() async {
    await FirebaseAuth.instance.signOut();
    ScopedModel.of<UserModel>(context).deleteUserData();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false);
  }

  void _deleteAccount() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    user.delete().then((onValue) {
      ScopedModel.of<UserModel>(context).deleteUserAccount();
      Navigator.pushNamedAndRemoveUntil(context, '/register', (Route<dynamic> route) => false);
    }).catchError((onError) {
      print(onError);
    });
  }
}
