import 'package:flutter/material.dart';
import 'package:langapp/model/app_model.dart';
import 'package:langapp/pages/daily_goal_page/daily_goal_page.dart';
import 'package:langapp/pages/home_menu_page/home_controller.dart';
import 'package:langapp/pages/intro_page/intro_controller.dart';
import 'package:langapp/pages/language_page/language_page.dart';
import 'package:langapp/pages/learn_page/learn_page_controller.dart';
import 'package:langapp/pages/learn_page/speed_test_menu_page.dart';
import 'package:langapp/pages/learn_page/theory_page.dart';
import 'package:langapp/pages/login_page/login_page.dart';
import 'package:langapp/pages/register_page/register_page.dart';
import 'package:langapp/pages/reset_password_page/reset_password_page.dart';
import 'package:langapp/pages/welcome_page/welcome_page.dart';
import 'package:langapp/styles/colors.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: hide clock and battery info

    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        title: 'Langgarden',
        initialRoute: "/intro",
        routes: {
          '/': (context) => HomeController(),
          '/intro': (context) => IntroController(),
          '/login': (context) => LoginPage(),
          '/reset_password': (context) => ResetPasswordPage(),
          '/register': (context) => RegisterPage(),
          '/welcome': (context) => WelcomePage(),
          '/choose_language': (context) => LanguagePage(),
          '/choose_daily_goal': (context) => DailyGoalPage(),
          // TODO: poprawne ścieżki odpowiednio dla kursów
          "/theory": (context) => TheoryPage(courseTitle: "None"),
          "/test": (context) => SpeedTestMenuTest(),
          "/session": (context) => LearnPageController(courseTitle: "None"),
        },
        // sets theme for the entire app
        theme: ThemeData(
          fontFamily: 'MerriweatherSans',
          scaffoldBackgroundColor: WHITE,
          // backgroundColor for appbar
          primaryColor: WHITE,
          textTheme: TextTheme(
            title: TextStyle(
              color: BROWN_DARK,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
            button: TextStyle(
              fontSize: 14,
            ),
            body1: TextStyle(
              fontSize: 14,
              color: BROWN_DARK,
            ),
          ),
        ),
      ),
    );
  }
}
