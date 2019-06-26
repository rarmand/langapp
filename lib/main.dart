import 'package:flutter/material.dart';
import 'package:langapp/pages/Intro/main.dart';
import 'package:flutter/services.dart';
import 'package:langapp/styles/colors.dart';
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

    return MaterialApp(
      title: 'Langgarden',
      home: IntroPagesView(),

      // sets theme for the entire app
      theme: ThemeData(
        fontFamily: 'MerriweatherSans',
        scaffoldBackgroundColor: WHITE,

        // backgroundColor for appbar
        primaryColor: WHITE,

        textTheme: TextTheme(
          title: TextStyle(
            color: BROWN_DARK,
            fontSize: 20.0,
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
    );
  }
}
