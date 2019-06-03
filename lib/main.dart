import 'package:flutter/material.dart';
import 'package:langapp/pages/Intro/secintro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Langgarden',
      theme: ThemeData(fontFamily: 'MerriweatherSans'),
      home: IntroPage(),
    );
  }
}
