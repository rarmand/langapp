import 'package:flutter/material.dart';
import 'package:langapp/pages/Intro/intro.dart';
import 'package:langapp/pages/Intro/register_page.dart';
import 'package:langapp/pages/Intro/reset_password_page.dart';
import 'package:langapp/pages/Intro/secintro.dart';
import 'package:langapp/pages/Intro/trdintro.dart';
import 'package:langapp/pages/Intro/welcome_page.dart';

import 'daily_goal_page.dart';
import 'language_page.dart';
import 'login_page.dart';

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
