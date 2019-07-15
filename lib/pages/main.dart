import 'package:flutter/material.dart';
import 'package:langapp/pages/daily_goal_page/daily_goal_page.dart';
import 'package:langapp/pages/intro/secintro.dart';
import 'package:langapp/pages/intro/trdintro.dart';
import 'package:langapp/pages/language_page/language_page.dart';
import 'package:langapp/pages/login_page/login_page.dart';
import 'package:langapp/pages/profile_page/profile_page.dart';
import 'package:langapp/pages/register_page/register_page.dart';
import 'package:langapp/pages/reset_password_page/reset_password_page.dart';
import 'package:langapp/pages/settings_page/settings_page.dart';
import 'package:langapp/pages/welcome_page/welcome_page.dart';
import 'package:langapp/pages/intro/intro.dart';
import 'package:langapp/pages/home_page/home_page.dart';

class IntroPagesView extends StatefulWidget {
  _IntroPagesView createState() {
    return _IntroPagesView();
  }
}

// TODO: responsywność aplikacji
class _IntroPagesView extends State<IntroPagesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          SettingsPage(),
          ProfilePage(),
          HomePage(),
          DailyGoalPage(),
          LanguagePage(),
          WelcomePage(),
          LoginPage(),
          RegisterPage(),
          ResetPasswordPage(),
          IntroPage(),
          SecIntroPage(),
          TrdIntroPage(),
        ],
      ),
    );
  }
}
