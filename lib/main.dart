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
      theme: ThemeData(fontFamily: 'MerriweatherSans'),
      home: IntroPagesView(),
    );
  }
}
