import 'package:flutter/material.dart';
import 'package:langapp/components/bubble/bubbles.dart';
import 'package:langapp/styles/colors.dart';

class LoadCoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(24.0),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 64.0),
              Text(
                "Time for speed test!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GREEN_LIGHT,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40.0),
              Text(
                "Choose a good answer as fast as you can!\nYou have 3 chances.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: BROWN_DARK,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 56.0),
              Text(
                "Good luck!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: BROWN_DARK,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40.0),
              Bubbles(),
            ],
          ),
        ),
      ),
    );
  }
}
