import 'package:flutter/material.dart';
import 'package:langapp/pages/Intro/intro.dart';
import 'package:langapp/pages/Intro/resetPasswordPage.dart';
import 'package:langapp/pages/Intro/secintro.dart';
import 'package:langapp/pages/Intro/trdintro.dart';
import 'package:langapp/pages/Intro/loginPage.dart';
import 'package:langapp/pages/Intro/registerPage.dart';
import 'package:langapp/pages/Intro/welcomePage.dart';

class IntroPagesView extends StatefulWidget {
  _IntroPagesView createState() {
    return _IntroPagesView();
  }
}

class _IntroPagesView extends State<IntroPagesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
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
