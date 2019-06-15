import 'package:flutter/material.dart';
import 'package:langapp/pages/Intro/main.dart';
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
        appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(
              title: TextStyle(
                color: Color(0xFF6D4C41),
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'MerriweatherSans',
              ),
            )),
        primarySwatch: Colors.blue,
        // backgroundColor for major parts of APP, toolbars, tabbars
        primaryColor: Color(0xFF38D900),
        // textTheme: TextTheme(
        //   headline: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.red),
        //   title: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.red),
        //   body1: TextStyle(
        //     fontSize: 15.0,
        //     fontWeight: FontWeight.normal,
        //     color: Color(0xFF6D4C41),
        //   ),
        //   body2: TextStyle(
        //     fontSize: 15.0,
        //     fontWeight: FontWeight.normal,
        //     color: Colors.white,
        //   ),
        // ),
      ),
    );
  }
}
