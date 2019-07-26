import 'package:flutter/material.dart';
import 'package:langapp/pages/daily_goal_page/daily_goal_page.dart';
import 'package:langapp/pages/intro/secintro.dart';
import 'package:langapp/pages/intro/trdintro.dart';
import 'package:langapp/pages/language_page/language_page.dart';
import 'package:langapp/pages/login_page/login_page.dart';
import 'package:langapp/pages/register_page/register_page.dart';
import 'package:langapp/pages/reset_password_page/reset_password_page.dart';
import 'package:langapp/pages/wait_page/wait_page.dart';
import 'package:langapp/pages/welcome_page/welcome_page.dart';
import 'package:langapp/pages/intro/intro.dart';

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
          WaitPage(courseChoice: "Repetition", courseName: "Course Name"),
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
