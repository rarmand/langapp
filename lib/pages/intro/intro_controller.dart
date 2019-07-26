import 'package:flutter/material.dart';
import 'package:langapp/pages/intro/intro.dart';
import 'package:langapp/pages/intro/secintro.dart';
import 'package:langapp/pages/intro/trdintro.dart';

// TODO: dopracować shadow i wielkość ikonek
class IntroController extends StatefulWidget {
  @override
  _IntroControllerState createState() => _IntroControllerState();
}

class _IntroControllerState extends State<IntroController> {
  final List<Widget> pages = [
    IntroPage(key: PageStorageKey("IntroPage")),
    SecIntroPage(key: PageStorageKey("SecIntroPage")),
    TrdIntroPage(key: PageStorageKey("TrdIntroPage")),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}

/*
Scaffold(
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
    */
