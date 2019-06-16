import 'package:flutter/material.dart';
import 'package:langapp/pages/Intro/main.dart';
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
    return MaterialApp(
      title: 'Langgarden',
      home: IntroPagesView(),

      // sets theme for the entire app
      theme: ThemeData(
        fontFamily: 'MerriweatherSans',
        scaffoldBackgroundColor: Color(WHITE),

        // backgroundColor for appbar
        primaryColor: Color(WHITE),

        textTheme: TextTheme(
          display1: TextStyle(
            fontSize: 10,
          ),
          overline: TextStyle(
            fontSize: 22,
          ),
          title: TextStyle(
            color: Color(BROWN_DARK),
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
          button: TextStyle(
            fontSize: 15,
          ),
          body1: TextStyle(
            fontSize: 15,
            color: Color(BROWN_DARK),
          ),
          caption: TextStyle(
            fontSize: 15,
          ),
          subtitle: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
